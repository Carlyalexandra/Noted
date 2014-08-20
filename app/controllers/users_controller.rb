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

  # def show_partial
  #   respond_to do |format|               
  #     format.js
  #   end        
  # end 

  def show
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    respond_to do |format|
      format.html {redirect_to (current_user), notice: "user updated"}
      format.json { respond_with_bip(@user) }
    end
  else
     respond_to do |format|
      format.html {render :edit}
      format.json { respond_with_bip(@user) }
    end
  end 
    

  def destroy
    @user = current_user
      @user.destroy
      redirect_to root_path
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :fname, :lname)
  end

end
