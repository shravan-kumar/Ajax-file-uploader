class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :date
      t.integer :number
      t.string :description

      t.timestamps null: false
    end
  end
end
