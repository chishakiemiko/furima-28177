class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :information	
    	t.string	:name
      t.integer :product_status_id
      t.integer	:category_id 
      t.integer	:shipping_fee_burden_id
      t.integer :price	
      t.integer	:prefecture_id	
      t.integer	:day_to_ship_id	
      t.integer	:user_id	
      
      t.timestamps
    end
  end
end
