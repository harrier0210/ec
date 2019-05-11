# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Basket < ApplicationRecord
  include Hashid::Rails
  belongs_to :user
  has_many :basket_products, dependent: :destroy 
  has_many :products, through: :basket_products

  def total_price(product_ids: nil)
    products = product_ids ? self.products.where(id: product_ids) : self.products
    PriceCalculator.total(products)
  end
end
