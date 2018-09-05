class Addhousetable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |table|
      table.string :address, null: false
      table.timestamps
    end
  end
end
