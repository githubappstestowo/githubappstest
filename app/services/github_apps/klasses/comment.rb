module GithubApps
  module Klasses
    class Comment
      include ActiveModel::Model

      attr_accessor :id, :user, :body, :url
    end
  end # module Klasses
end # module GithubApps
