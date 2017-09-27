module Api
  class AuthController < ApplicationController
    def index
      render json: {test: 'test'}, status: :ok
    end
  end
end
