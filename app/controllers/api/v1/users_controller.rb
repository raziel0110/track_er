module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: [:create, :index]

      def index
        @users = User.sort_descending

        render json: @users, each_serializer: UserSerializer, status: :ok
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: {error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private

      def user_params
        params.permit(:name, :username, :email, :password, :password_confirmation)
      end

      def find_user
        @user = User.find(params[:id])

        rescue ActiveRecord::RecordNotFound
          render json: {error: 'User not Found'}, status: :not_found
      end
    end
  end
end
