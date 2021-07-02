class User::OrdersController < ApplicationController
  before_action :exclude_admin

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    order = current_user.orders.new
    order.save
      cart.contents.each do |item_hash, quantity|
        if item_hash.keys.include?(:artwork)
          order.order_artworks.create({
            artwork_id: Artwork.find(item_hash[:artwork]).id,
            quantity: quantity,
            price: Artwork.find(item_hash[:artwork]).cost
            })
          new_quantity = Artwork.find(item_hash[:artwork]).inventory - quantity
          Artwork.find(item_hash[:artwork]).update(inventory: new_quantity)
          Artwork.find(item_hash[:artwork]).set_availability_based_on_inventory
        elsif item_hash.keys.include?(:classroom)
          order.order_classrooms.create({
            classroom_id: Classroom.find(item_hash[:classroom]).id,
            quantity: quantity,
            price: Classroom.find(item_hash[:classroom]).cost
            })
        elsif item_hash.keys.include?(:clothing)
          order.order_clothings.create({
            clothing_id: Clothing.find(item_hash[:clothing]).id,
            quantity: quantity,
            price: Clothing.find(item_hash[:clothing]).cost
            })
          new_quantity = Clothing.find(item_hash[:clothing]).inventory - quantity
          Clothing.find(item_hash[:clothing]).update(inventory: new_quantity)
          Clothing.find(item_hash[:clothing]).set_availability_based_on_inventory
        end
      end
    session.delete(:cart)
    flash[:notice] = "Order created successfully!"
    redirect_to '/profile/orders'
  end

  def cancel
    order = current_user.orders.find(params[:id])
    order.cancel
    redirect_to "/profile/orders/#{order.id}"
  end
end
