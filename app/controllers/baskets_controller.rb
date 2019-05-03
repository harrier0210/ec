class BasketsController < ApplicationController
  before_action :authenticate_user!

  def show
    basket = current_user.prepare_basket
    @products = basket.products
    @total_price = basket.total_price
  end
  
  def create
    basket = current_user.prepare_basket
    product = Product.find(params[:product_id])
    basket.basket_products.create!(product_id: product.id)
  end

  def destroy
    basket = Basket.find(params[:id])
    product = Product.find(params[:product_id])
    basket_product = basket.basket_products.find_by(product_id: product.id)
    basket_product.destroy!
    redirect_to basket_path
  end

end
