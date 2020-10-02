class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_code       ,default: ""  ,null: false
      t.integer :prefectures_id                ,null: false
      t.string  :city            ,default: ""  ,null: false
      t.string  :block           ,default: ""  ,null: false
      t.string  :building        ,default: ""
      t.string  :phone_num                     ,null: false
      t.references :buyer                      ,null: false      ,foreign_key: true
      t.timestamps
    end
  end
end
