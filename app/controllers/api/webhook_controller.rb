module Api
  class WebhookController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      binding.pry
      render json: {test: 'test'}, status: :ok
    end
  end
end
