require 'jwt'

class SessionsController < ApplicationController
  
    def create
      @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        token = JWT.encode({ user_id: @user.id, exp: 24.hours.from_now.to_i }, 
                           Rails.application.secrets.secret_key_base, 'HS256')
        render json: { user: @user.id, token: token }, status: :created
      else
        render json: { message: 'Invalid email/password combination' }, status: :unauthorized
      end
    end
  end