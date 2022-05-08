class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :telephone_number, :user_id, :content_id, :token

  with_options presence: true do
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :building, numericality: { only_integer: true }, allow_blank: true
  validates :telephone_number, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :content_id, presence: true
  validates :token, presence: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, content_id: content_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end