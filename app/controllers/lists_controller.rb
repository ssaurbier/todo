class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]


  def index
      @clubs = Club.where(id: params[:ids])
  end

  def index
  respond_to do |format|
    format.html {
      @user = current_user
      @lists = List.all
      @list = List.new
      @items = Item.all
      @item = Item.new
      binding.pry
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
      @item = item.new
      @list.item = Item.new
    else
      authenticate_user!
    end
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
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
    @user = User.find(current_user)
    # render :json => List.find(params[:id])
  end

  protected
  def list_params
    params.require(:list).permit(:title, :due_date, :user)
  end

  def item_params
    params.require(:item).permit(:name, :due_date, :user, :list)
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
