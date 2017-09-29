module GithubApps
  module Responses
    class InstallationRepositories < GithubApps::Responses::Base
      def initialize(token)
        @uri = URI.parse(
          [ENV['GITHUB_APPS_HOST'], "/installation/repositories"].join
        )
        @token = token
      end

      def self.response(token)
        new(token).response
      end

      private

      def request
        http_get.tap do |request|
          request['Authorization'] = "Bearer #{@token}"
          request['Accept'] = "application/vnd.github.machine-man-preview+json"
        end
      end
    end # class InstallationRepositories
  end # module Responses
end # module GithubApps
