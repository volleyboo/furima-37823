class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :telephone_number, :user_id, :content_id

  with_options presence: true do
  validates :postal_code, presence: true
  validates :area_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :user_id, presence: true
  validates :content_id, presence: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, content_id: content_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end