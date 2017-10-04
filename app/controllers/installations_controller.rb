class InstallationsController < ApplicationController
  def index
    @installations = GithubApps::AppInstallationsParser.installations
  end

  def new
    GithubApps::InstallationCreator
      .create(current_user, params[:installation_id])
    redirect_to root_path
  end

  def show
    @repositories =
      GithubApps::InstallationRepositoriesParser.repositories(params[:id])
  end
end
