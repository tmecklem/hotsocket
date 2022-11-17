class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    get_or_create_cart
  end

  def add
    get_or_create_cart
    product = Product.find_by(sku: params[:product_sku])

    if product.update(inventory: product.inventory - 1)
      @cart.cart_items << CartItem.new(cart: @cart, product: product)
      ProductChannel.inventory_changed(product)
    else
      raise "No inventory!"
    end

    redirect_to cart_path
  end

  def remove
    get_or_create_cart

    cart_item = @cart.cart_items.find(params[:cart_item_id])
    product = cart_item.product
    cart_item.destroy

    product.update(inventory: product.inventory + 1)
    ProductChannel.inventory_changed(product)

    redirect_to cart_path
  end

  private

  def get_or_create_cart
    @cart = current_user.cart || @current_user.create_cart
  end
end
