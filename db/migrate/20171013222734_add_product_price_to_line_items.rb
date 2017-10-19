class AddProductPriceToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :product_price, :decimal, precision: 8, scale: 2
  end

  def up
    LineItem.all.each do |item|
      item.product_price = item.product.price
    end
  end

  def down
    remove_column :line_items, :product_price
  end
end
