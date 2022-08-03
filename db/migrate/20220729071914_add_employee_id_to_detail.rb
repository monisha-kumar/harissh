class AddEmployeeIdToDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :employee_id, :integer
    add_index :details, :employee_id
  end
end
