class UsersController < ApplicationController
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'

  def search
      q = params[:q].to_s
      @q = q
      @main = Youtube.new.main(q) 
  end

  def show
      @project = current_user.projects.last
      @note = @project.notes.first
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
