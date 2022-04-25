class UsersController < ApplicationController

  def edit
  end

  def sign_up
    @users = User.all
  end


end
