class InstallationsController < ApplicationController
  def new
    GithubApps::InstallationCreator
      .create(current_user, params[:installation_id])
    redirect_to root_path
  end
end
