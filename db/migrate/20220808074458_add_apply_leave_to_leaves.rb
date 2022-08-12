class AddApplyLeaveToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves,:type_of_leave,:string
    add_column :leaves,:from_date,:date
    add_column :leaves,:to_date,:date
  end
end
