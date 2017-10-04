module GithubApps
  module Klasses
    class Repo
      include ActiveModel::Model

      attr_accessor :id, :name, :owner, :installation_id

      def pulls
        pulls_response.map do |pr|
          PullRequest.new({
            id: pr['id'],
            url: pr['url'],
            number: pr['number'],
            title: pr['title'],
            body: pr['body'],
            comments_url: pr['comments_url'],
            installation_id: @installation_id,
          })
        end
      end

      private

      def pulls_response
        JSON.parse(
          GithubApps::Responses::PullRequests.response(token, self).body
        )
      end

      def token
        GithubApps::InstallationAccessToken.access_token(@installation_id)
      end
    end
  end # module Klasses
end # module GithubApps
