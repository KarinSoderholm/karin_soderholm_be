class CartController < ApplicationController
  before_action :exclude_admin

  def add_item
    helper_hash = {}
    if params[:classroom_id]
      item = Classroom.find(params[:classroom_id])
      helper_hash[:classroom] = item.id
    elsif params[:clothing_id]
      item = Clothing.find(params[:clothing_id])
      helper_hash[:clothing] = item.id
    elsif params[:artwork_id]
      item = Artwork.find(params[:artwork_id])
      helper_hash[:artwork] = item.id
    end

    session[:cart] ||= {}
    cart.add_item(helper_hash)
    session[:cart] = cart.contents
    flash[:notice] = "#{item.name} has been added to your cart!"
  
    redirect_to cart_path
  end

  def show
  end

  def empty
    session.delete(:cart)
    redirect_to '/cart'
  end

  def remove_item
    session[:cart].delete(params[:item_id])
    redirect_to '/cart'
  end

  def update_quantity
    if params[:change] == "more"
      cart.add_item(params[:item_id])
    elsif params[:change] == "less"
      cart.less_item(params[:item_id])
      return remove_item if cart.count_of(params[:item_id]) == 0
    end
    session[:cart] = cart.contents
    redirect_to '/cart'
  end
end
