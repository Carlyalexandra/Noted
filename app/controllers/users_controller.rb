class UsersController < ApplicationController
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
before_action :authenticate_user!, except: :show

  def search
      q = params[:q].to_s
      @q = q
      @main = Youtube.new.main(q) 
  end

  def show
    
  end

  def edit

  end

  def update
    
  end

  def destroy
    @user.delete
  end


end
