class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.limit(10).order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
