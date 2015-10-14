class ItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_permission, only: [:destroy]

  # def index
  #   @items = Item.all
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #       render json: 2
  #     end
  #   end
  # end

  def index
    @lists = List.all
    @list = List.new
    @items = Item.all
    @item = Item.new
    respond_to do |format|
      format.html
      format.json do
        categories = @lists.map{ |list| list.category }
        items = @lists.map{ |list| list.items.count }
        binding.pry
        render json: [categories, items]
      end
    end
  end

  def create
    item_params[:list] = List.find_by(title: item_params[:list_id])
    @item = Item.new(item_params)
    @user = current_user
    @list = List.find(item_params[:list_id].to_i)
    list = List.find_by(title: @list.title)
    @item.list = list
    @item[:user_id] = @user.id
    @item[:due_date] = @item.due_date
    respond_to do |format|
    if @item.save
        format.json { render json: @item, status: :created}
        flash[:success] = "List successfully Added."
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
        flash[:warning] = @item.errors.full_messages.join(', ')
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @list = @item.list
    @item.destroy
  end

  protected
  def item_params
    params.require(:item).permit(:name, :due_date, :list, :list_id)
  end

  # def require_permission
  #   @vote = Vote.find(params[:id])
  #   @product = @vote.review.product
  #   if (current_user != @vote.user) && !current_user.admin?
  #     flash[:error] = "You can't delete someone else\'s vote!"
  #     redirect_to @product
  #   end
  # end
end
