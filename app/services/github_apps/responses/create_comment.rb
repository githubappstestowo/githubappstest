module GithubApps
  module Responses
    class CreateComment < GithubApps::Responses::Base
      def initialize(token, uri, body)
        @uri = URI.parse(uri)
        @token = token
        @body = body
      end

      def self.response(token, repo, body)
        new(token, repo, body).response
      end

      private

      def request
        http_post.tap do |request|
          request['Authorization'] = "Bearer #{@token}"
          request['Accept'] = "application/vnd.github.machine-man-preview+json"
          request.body = { body: @body }.to_json
        end
      end
    end # class CreateComment
  end # module Responses
end # module GithubApps
