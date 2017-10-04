module GithubApps
  module Responses
    class PullRequests < GithubApps::Responses::Base
      def initialize(token, repo)
        @uri =
          URI.parse(
            [
              ENV['GITHUB_APPS_HOST'],
              "/repos",
              "/#{repo.owner}",
              "/#{repo.name}",
              "/pulls"
            ].join
          )
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
    end # class PullRequests
  end # module Responses
end # module GithubApps
