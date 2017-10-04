module GithubApps
  class CommentCreator
    def self.create(installation_id, path, body)
      new(installation_id, path, body).create
    end

    def create
      return true if response.code == '201'
      false
    end

    private

    def initialize(installation_id, path, body)
      @installation_id = installation_id
      @path = path
      @body = body
    end

    def response
      GithubApps::Responses::CreateComment.response(token, @path, @body)
    end

    def token
      GithubApps::InstallationAccessToken.access_token(@installation_id)
    end
  end # class CommentCreator
end # module GithubApps
