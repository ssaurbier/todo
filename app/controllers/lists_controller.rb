class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_filter :phone_confirmation_redirect
  # before_action :require_permission, only: [:edit, :update, :destroy]

  def index
  respond_to do |format|
    format.html {
      @lists = List.all
      @list = List.new
      @items = Item.all
      @item = Item.new
      render :index
    }
    end
  end

  def index
    @lists = List.all
    @list = List.new
    @items = Item.all
    @item = Item.new
    respond_to do |format|
      format.html
      format.json do
        render json: 2
      end
    end
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
    respond_to do |format|
      if @list.save
        format.json { render json: @list, status: :created}
        flash[:success] = "List successfully Added."
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        flash[:warning] = @list.errors.full_messages.join(', ')
      end
    end
  end

  def destroy
    @user = current_user
    @product = Product.find(params[:product_id])
    Review.find(params[:id]).destroy
    flash[:success] = 'Review Deleted'
    redirect_to product_path(@product)
  end

  def show
    @list = List.find(params[:id])
    @user = User.find(current_user)
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
