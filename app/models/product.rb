# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  price       :integer          not null
#  unit        :string           default("yen"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :unit, presence: true

  def display_price
    case unit
    when 'yen'
      "#{price.to_s(:delimited)} 円"
    when 'usd'
      "$ #{price.to_s(:delimited)}"
    end
  end
end