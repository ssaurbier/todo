class ItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_permission, only: [:destroy]

  def create
    item_params[:list] = List.find_by(title: item_params[:list_id])
    @item = Item.new(item_params)
    # @item.user = current_user
    # list_id = List.find(params[:list_id])
    list = List.find_by(title: list)
    @item.list = list
    if @item.save
      flash[:success] = "List successfully Added."
      # render :json => @list
      redirect_to lists_path
    else
      flash[:warning] = @item.errors.full_messages.join(', ')
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
