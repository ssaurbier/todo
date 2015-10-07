class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @list = List.new
        render :index
      }
      format.json {
        render :json => {
          list: List.all,
          user: current_user
        }
      }
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params.permit(:title, :due_date, :user_id))
    if @list.save
      flash[:success] = "List successfully Added."
      render :json => @list
    else
      flash[:warning] = @list.errors.full_messages.join(', ')
    end
  end

  def show
    render :json => List.find(params[:id])
  end

  protected
  def list_params
    params.require(:list).permit(:title, :due_date, :user_id)
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
