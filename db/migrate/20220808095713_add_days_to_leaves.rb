class AddDaysToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves,:days,:string
  end
end
