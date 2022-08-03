class CreateQualification < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :stream
      t.string :yop
      t.string :project
      t.string :aggregate
    end
  end
end
