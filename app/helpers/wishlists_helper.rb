# frozen_string_literal: true

module WishlistsHelper
  def imageurl(group)
    return group.icon if group.icon

    'https://bitsofco.de/content/images/2018/12/broken-1.png'
  end

  def paybutton(wish)
    @paid = Payment.where(wishlist_id: wish.id)
    @paid.each do |p|
      @user = User.find_by(id: p.user_id)
    end
    return "Paid by #{@user.name}" if @paid.any?
    return if wish.author_id == current_user.id

    (link_to 'Pay wish', wishlists_payments_path(wish), method: :post).html_safe
  end

  def paidornot(wish)
    @pay = Payment.where(wishlist_id: wish.id)

    return unless @pay.any?

    @pay.each do |p|
      @user = User.find_by(id: p.user_id)
    end
    "Paid by #{@user.name}"
  end

  
 
end
