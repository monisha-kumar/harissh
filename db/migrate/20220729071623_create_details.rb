class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :name
      t.string :dob
      t.string :f_name
      t.string :m_name
      t.string :address
      t.string :experience
      t.string :ph_no
      t.string :email
    end
  end
end
