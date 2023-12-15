class CreateTableProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :category, null: false, index: true
      t.string :image_url
      t.string :name, null: false
      t.decimal :amount, null: false
      t.timestamps
    end
  end
end
