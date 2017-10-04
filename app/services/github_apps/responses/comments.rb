module GithubApps
  module Responses
    class Comments < GithubApps::Responses::Base
      def initialize(token, url)
        @uri = URI.parse(url)
        @token = token
      end

      def self.response(token, repo)
        new(token, repo).response
      end

      private

      def request
        http_get.tap do |request|
          request['Authorization'] = "Bearer #{@token}"
          request['Accept'] = "application/vnd.github.machine-man-preview+json"
        end
      end
    end # class Comments
  end # module Responses
end # module GithubApps
