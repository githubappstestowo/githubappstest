class PullRequestsController < ApplicationController
  def index
    @pulls = repo.pulls
  end

  private

  def repo
    @repo ||=
      GithubApps::Klasses::Repo.new(
        params.require(:repo)
              .permit(:id, :name, :owner, :installation_id)
              .merge!(installation_id: params[:installation_id])
      )
  end
end
