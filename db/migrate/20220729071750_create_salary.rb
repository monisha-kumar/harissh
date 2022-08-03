class CreateSalary < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.string :basic_pay
      t.string :hra
      t.string :allowance
      t.string :deduction
      t.string :total_salary
    end
  end
end
