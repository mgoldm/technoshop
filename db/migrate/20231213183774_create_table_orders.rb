class CreateTableOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.decimal :amount, null: false
      t.references :product, null: false
      t.timestamps
    end
  end
end
