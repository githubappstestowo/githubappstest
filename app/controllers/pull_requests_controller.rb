class PullRequestsController < ApplicationController
  def index
    set_request_uri
    @pulls = repo.pulls
  end

  private

  def repo
    @repo ||=
      GithubApps::Klasses::Repo.new(
        params.require(:repo)
              .permit(:id, :name, :owner, :installation_id)
              .merge!(installation_id: installation_id)
      )
  end

  def installation_id
    @installation_id ||= params[:installation_id]
  end

  def set_request_uri
    @request_uri ||= request.env['REQUEST_URI']
  end
end
