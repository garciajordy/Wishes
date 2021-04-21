# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end
  def show
    @payments = Payment.where(user_id: current_user.id).order(created_at: :asc)
  end

  def create
    @payment = current_user.payments.create(wishlist_id: params[:format])
    redirect_back(fallback_location: root_path)
  end

  def index
    @payments = Payment.where(user_id: current_user.id).order(created_at: :desc)
  end
end
