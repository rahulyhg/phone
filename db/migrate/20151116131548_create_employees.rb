class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :name
      t.string :phone
      t.string :email
      t.string :location

      t.timestamps null: false
    end
  end
end
