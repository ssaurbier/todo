class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show


  def index
    @users = User.all
    @user = User.find(current_user)
    @lists = @user.lists
  end

  def show
    @user = User.find(current_user)

  end

end
