module GithubApps
  module Responses
    class InstallationToken < GithubApps::Responses::Base
      def initialize(id, token)
        @uri = URI.parse(
          [ENV['GITHUB_APPS_HOST'], "/installations/#{id}/access_tokens"].join
        )
        @token = token
      end

      def self.response(id, token)
        new(id, token).response
      end

      private

      def request
        http_post.tap do |request|
          request['Authorization'] = "Bearer #{@token}"
          request['Accept'] = "application/vnd.github.machine-man-preview+json"
        end
      end
    end # class InstallationToken
  end # module Responses
end # module GithubApps
