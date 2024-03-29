class CreateProponents < ActiveRecord::Migration[7.1]
  def change
    create_table :proponents do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :street_name, null: false
      t.integer :house_number, null: false
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :phone_number, null: false
      t.float :salary, null: false

      t.timestamps
    end
  end
end
