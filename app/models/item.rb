class Item < ApplicationRecord

  has_one_attached :image

  include ActiveHash::Associations
  has_many  :prefecture, :category, :day_to_ship, :product_states, :shipping_fee_burden
  
  with_options presence: true do
    validates :prefecture, :category, :day_to_ship, :product_states, :shipping_fee_burden, :name, :information, :price
    validates :information format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :price format: { with: /\A[a-z0-9]+\z/i }

    validates :price,numericality: { only_integer: true, greater_than: 300, less_than: 9999999
    
  end
end
