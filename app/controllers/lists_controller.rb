class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  # def index
  #   @user = current_user
  #   @list = List.new(params.permit(:title, :due_date, :user_id))
  #   @lists = List.all
  #
  # end

  def index
  respond_to do |format|
    format.html {
      @lists = List.all
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


  def new
    if signed_in?
      @list = List.new
    else
      authenticate_user!
    end
  end

  def create
    @list = List.new(params.permit(:title, :due_date, :user_id))
    if @list.save
      flash[:success] = "List successfully Added."
      # render :json => @list
      redirect_to lists_path

    else
      flash[:warning] = @list.errors.full_messages.join(', ')
    end
  end

  def show
    @list = List.find(params[:id])
    # render :json => List.find(params[:id])
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
