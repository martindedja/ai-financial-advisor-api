class UsersController < ApplicationController
  
    def create
      puts user_params
      Rails.logger.info user_params
      user = User.new(user_params)
      if user.save
        render json: { status: 'User created successfully' }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :risk_tolerance, :financial_goals)
    end
  end
  