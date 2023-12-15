# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    cart_llen=Red.llen("user-purchase-#{current_user.id}")
    @cart_elements=Red.lrange("user-purchase-#{current_user.id}", 0, cart_llen.to_i).map{|el| JSON.parse(el)}
    @cart = @cart_elements.group_by(&:itself).transform_values(&:count)
    @amount=@cart_elements.map{|el| el["amount"]}.sum
  end

  def purchase
    product=Product.find(params[:purchase_id])
    product_attr={id: product.id, amount: product.amount, name: product.name, image_url: product.image_url}.to_json
    Red.lpush("user-purchase-#{current_user.id}", product_attr)

    redirect_to catalogs_path
  end

  def remove
    Red.lrem("user-purchase-#{current_user.id}", params[:count], params[:product])

    redirect_to cart_path
  end

  def checkout
    cart_llen=Red.llen("user-purchase-#{current_user.id}")
    Red.lrange("user-purchase-#{current_user.id}", 0, cart_llen.to_i).each do |el|
      pr=JSON.parse(el)
      product=Product.find(pr["id"])

      Order.create!(user: current_user, product: product, amount: product.amount)
    end

    redirect_to root_path
  end
end
