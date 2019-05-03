class AddColumnProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :image, :string
  end
end
