class CreateConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :conversions do |t|
      t.string :starting_currency
      t.string :final_currency
      t.float :amount
      t.float :converted_amount
      t.timestamps
    end
  end
end
