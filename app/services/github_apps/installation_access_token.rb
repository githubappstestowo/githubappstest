module GithubApps
  class InstallationAccessToken
    def self.access_token(installation_id)
      new(installation_id).access_token
    end

    def access_token
      parsed_response['token']
    rescue
      raise 'Unautorized!'
    end

    private

    def initialize(installation_id)
      @installation_id = installation_id
    end

    def parsed_response
      @response ||=
        JSON.parse(
          GithubApps::Responses::InstallationToken.response(
            @installation_id, GithubApps::Jwt.jwt
          ).body
        )
    end
  end # class InstallationAccessToken
end # module GithubApps
