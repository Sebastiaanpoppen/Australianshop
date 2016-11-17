class OrderItemsController < ApplicationController

  def create
    @cart = current_cart
    @order_item = @cart.order_items.new(order_item_params)
    @cart.save
    session[:cart_id] = @cart.id
  end

  def update
    @cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @cart.order_items
  end


  def destroy
    @cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @cart.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
