class CallbackController < ApplicationController
  def show
    user = GithubApps::OauthCreator.user(params[:code], params[:state])
    if user.present?
      session[:user_id] = user.id
      redirect_to select_repos_path
    else
      redirect_to root_path
    end
  end
end
