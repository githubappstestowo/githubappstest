class UsersController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out!'
  end
end
