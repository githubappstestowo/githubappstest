module GithubApps
  class OauthCreator
    def self.user(code, state)
      new(code, state).user
    end

    def user
      User.find_or_initialize_by(login: login).tap do |user|
        user.login = login
        user.url = parsed_response['url']
        user.uuid = parsed_response['id']
        user.account_type = parsed_response['type']
        user.save
      end
    rescue
      nil
    end

    private

    def initialize(code, state)
      @code = code
      @state = state
    end

    def login
      parsed_response['login']
    end

    def parsed_response
      @parsed_response ||= begin
        JSON.parse(
          GithubApps::Responses::OauthUser.response(access_token).body
        )
      end
    end

    def access_token
      GithubApps::Responses::OauthAccessToken
        .response(@code, @state)
        .body.match(/access_token=(\w+)&/)[1]
    rescue
      fail 'Unauthorize'
    end
  end # class OauthCreator
end # module GithubApps
