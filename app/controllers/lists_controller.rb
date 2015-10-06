class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @items = @user.items
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected
  def review_params
    params.require(:list).permit(:title, :due_date)
  end

  # def require_permission
  #   @review = Review.find(params[:id])
  #   @product = @review.product
  #   if (current_user != @review.user) && !current_user.admin?
  #     flash[:error] = "You can't someone elses review!"
  #     redirect_to @product
  #   end
  # end
end
