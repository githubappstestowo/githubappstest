module Api
  class AuthController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      render json: {test: 'test'}, status: :ok
    end
  end
end
