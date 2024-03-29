class AddInssDiscountToProponent < ActiveRecord::Migration[7.1]
  def change
    add_column :proponents, :inss_discount, :float
  end
end
