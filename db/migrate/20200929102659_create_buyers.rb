class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :user                  ,null: false       ,foreign_key: true
      t.references :item                                     ,foreign_key: true
      t.integer :price   ,index: true     ,null: false
      t.timestamps
    end
  end
end
