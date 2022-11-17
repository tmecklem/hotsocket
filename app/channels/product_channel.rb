class ProductChannel < ApplicationCable::Channel
  include Rails.application.routes.url_helpers
  extend Turbo::Streams::ActionHelper
  
  class << self
    def channel_name(product)
      "product-#{product.sku}"
    end

    def inventory_changed(product)
      template = ActionController::Base.render(partial: "products/product", locals: {product: product})
      payload = turbo_stream_action_tag(:update, target: "product-#{product.sku}", template: template)
      ActionCable.server.broadcast(channel_name(product), {payload: payload})
    end
  end
  
  def subscribed
    stream_from self.class.channel_name(product)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def product
    @product ||= Product.find_by(sku: params[:product_sku])
  end
end
