module GithubApps
  module Responses
    class OauthAccessToken < GithubApps::Responses::Base
      def initialize(code, state)
        @uri = URI.parse(
          [
            ENV['GITHUB_APPS_OAUTH_URL'],
            "?client_id=#{ENV['GITHUB_APPS_CLIENT_ID']}",
            "&client_secret=#{ENV['GITHUB_APPS_SECRET']}",
            "&code=#{code}",
            "&state=#{state}"
          ].join
        )
      end

      def self.response(code, state)
        new(code, state).response
      end

      private

      def request
        http_post
      end
    end # class OauthAccessToken
  end # module Responses
end # module GithubApps
