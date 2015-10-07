class ItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_permission, only: [:destroy]

  def index
    @user = User.find(current_user.id)
    @items = @user.item
  end

  def create
    @item = current_user.item.build(item_params)

    if @item.save
      @item.update_attribute(:next_ping_time, Time.now)
      @item.generate_next_ping_time
      Item.populate_sidekiq
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy

  end

  protected

  def item_params
    params.require(:item).permit(:name, :list, :due_date)
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
