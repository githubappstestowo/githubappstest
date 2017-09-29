module GithubApps
  module Responses
    class OauthUser < GithubApps::Responses::Base
      def initialize(token)
        puts '+++++++++++++++++++++++++++++++++++++++++++++++++'
        puts token
        puts '+++++++++++++++++++++++++++++++++++++++++++++++++'
        @uri = URI.parse([ENV['GITHUB_APPS_HOST'], "/user"].join)
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
    end # class OauthUser
  end # module Responses
end # module GithubApps
