class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show


  def index
    @users = User.all

  end

  def create
  end

  def show
    @user = User.find(current_user)
  end



  def list_params
    params.require(:list).permit(
      :title, :due_date, :user_id
    )
  end
end
