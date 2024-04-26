module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authorize_request, except: [:login]
      rescue_from ActiveRecord::RecordNotFound, with: :handle_user_not_found

      def login
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])
          time = Time.now + 3600
          token = JsonWebToken.encode(user_id: @user.id, exp: time.utc.strftime('%m/%d/%Y %H:%M %p'), username: @user.username)

          render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username}, status: :ok
        else
          render json: {error: 'Unauthorized'}, status: :unauthorized
        end
      end

      private

      def authenticate_params
        params.permit(:email, :password)
      end

      def handle_user_not_found(e)
        render json: {error: 'User not found'}, status: :unauthorized
      end
    end
  end
end
