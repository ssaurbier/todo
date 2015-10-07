class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @list = List.all
    @user = current_user
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      flash[:success] = "List successfully Added."
      redirect_to root_path
    else
      flash[:warning] = @list.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
  end

  def destroy
  end

  protected
  def list_params
            binding.pry
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
