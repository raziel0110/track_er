class TestController < ApplicationController
  def def index
    render json: {message: "test"}, status: 200
  end
end
