module GithubApps
  class AppInstallationsParser
    def self.installations
      new.installations
    end

    def installations
      parsed_response.each_with_object({}) do |inst, result|
        result[inst['account']['login']] = inst['id']
      end
    end

    private

    def parsed_response
      @response ||=
        JSON.parse(
          GithubApps::Responses::AppInstallations.response(
            GithubApps::Jwt.jwt).body
        )
    end
  end # class AppInstallationsParser
end # module GithubApps
