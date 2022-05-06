class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :content
  has_one :shipping_address
  
end
