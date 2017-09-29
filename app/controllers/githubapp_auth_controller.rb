class GithubappAuthController < ApplicationController
  def create
    url = [
      ENV['GITHUB_APPS_AUTH_URL'],
      "?client_id=#{ENV['GITHUB_APPS_CLIENT_ID']}",
      "&state=randomdupa"
    ].join

    redirect_to url
  end
end
