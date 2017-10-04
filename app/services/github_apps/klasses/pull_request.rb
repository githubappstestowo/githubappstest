module GithubApps
  module Klasses
    class PullRequest
      include ActiveModel::Model

      attr_accessor :id,
                    :url,
                    :number,
                    :title,
                    :body,
                    :comments_url,
                    :installation_id

      def comments
        @comments ||= begin
          comments_parsed_response.map do |cmd|
            Comment.new({
              id: cmd['id'],
              user: cmd['user']['login'],
              body: cmd['body'],
              url: cmd['url'],
            })
          end
        end
      end

      private

      def comments_parsed_response
        JSON.parse(
          GithubApps::Responses::Comments.response(token, comments_url).body
        )
      end

      def token
        GithubApps::InstallationAccessToken.access_token(@installation_id)
      end
    end
  end # module Klasses
end # module GithubApps
