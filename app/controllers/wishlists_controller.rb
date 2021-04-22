class WishlistsController < ApplicationController
  def index
    @wishes = current_user.wishes.where.not(group_id: nil).order(created_at: :asc)
  end

  def show
    @wishes = current_user.wishes.where.not(group_id: nil).order(created_at: :desc)
  end

  def new
    session[:return_to] ||= request.referer
    @group = Group.find(params[:format])
    @user = current_user
    @wish = @user.wishes.new
  end
  def external
    @wishes = current_user.wishes.where(group_id: nil).order(created_at: :desc)
  end
  def externala
    @wishes = current_user.wishes.where(group_id: nil).order(created_at: :asc)
  end
  def newexternal
    session[:return_to] ||= request.referer
    @user = current_user
    @wish = @user.wishes.new
  end
  def create
    @user = current_user
    @wish = @user.wishes.create(wish_params)
    if @wish.save
      redirect_to session.delete(:return_to)
    else
      render :new
    end
  end

  private

  def wish_params
    params.require(:wishlist).permit(:name, :amount, :group_id)
  end
end
