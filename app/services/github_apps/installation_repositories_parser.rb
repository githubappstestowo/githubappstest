module GithubApps
  class InstallationRepositoriesParser < GithubApps::Responses::Base
    def self.repositories(installation_id)
      new(installation_id).repositories
    end

    def repositories
      parsed_response['repositories'].each_with_object({}) do |repo, result|
        result[repo['name']] = {id: repo['id'], name: repo['name'], owner: repo['owner']['login']}
      end
    end

    private

    def initialize(installation_id)
      @installation_id = installation_id
    end

    def parsed_response
      @response ||=
        JSON.parse(
          GithubApps::Responses::InstallationRepositories.response(token).body
        )
    end

    def token
      GithubApps::InstallationAccessToken.access_token(@installation_id)
    end
  end # class InstallationRepositoriesParser
end # module GithubApps
