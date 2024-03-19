class Api::V1::TestController < ApplicationController
  def index
    render json: {message: "test"}, status: 200
  end
end
