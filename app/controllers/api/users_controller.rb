module Api
  class UsersController < ApplicationController
      before_action :set_user, only: [:show]
      def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'User created successfully' }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
          render json: @user.as_json(only: [:id, :name, :email])
      end

      private 

          def set_user
              @user = User.find(params[:id])
          end
      
          def user_params
            params.permit(:name, :email, :password, :password_confirmation, :risk_tolerance, :financial_goals)
          end
      end
  end
  