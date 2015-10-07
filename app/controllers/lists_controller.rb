class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @list = List.all
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:success] = "Product successfully Added."
      redirect_to root_path
    else
      flash[:warning] = @list.errors.full_messages.join(', ')
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
  def item_params
    params.require(:list).permit(:title, :list, :due_date)
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
