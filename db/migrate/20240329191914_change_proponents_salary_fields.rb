class ChangeProponentsSalaryFields < ActiveRecord::Migration[7.1]
  def change
    rename_column :proponents, :salary, :gross_salary
    add_column :proponents, :net_salary, :float
  end
end
