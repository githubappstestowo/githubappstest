class CommentsController < ApplicationController
  def create
    if create_comment
      redirect_to params[:referrer_path], notice: 'Comment successfully created!'
    else
      redirect_to params[:referrer_path], alert: 'Something went wrong!'
    end
  end

  private

  def create_comment
    GithubApps::CommentCreator
      .create(params[:installation_id], params[:path], params[:body])
  end
end
