class CreateThalakattuVaris < ActiveRecord::Migration[7.2]
  def change
    create_table :thalakattu_varis do |t|
      t.string :name
      t.string :area
      t.decimal :amount
      t.integer :payment_mode

      t.timestamps
    end
  end
end
