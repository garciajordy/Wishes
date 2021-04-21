class WishlistsController < ApplicationController
  def index
    @wishes = current_user.wishes.order(created_at: :asc)
  end

  def show
    @wishes = current_user.wishes.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:format])
    @wish = @group.wishlists.new
  end

  def create
    @group = Group.find(params[:group_id])
    @wish = @group.wishlists.create(wish_params)
    # @wish.author_id = current_user.id
    if @wish.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def wish_params
    params.require(:wishlist).permit(:name, :amount, :author_id)
  end
end
