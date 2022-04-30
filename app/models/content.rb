class Content < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :area
  belongs_to :days

  belongs_to :user
  #has_one :purchase
  
  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true  
  validates :state_id, presence: true  
  validates :charge_id, presence: true  
  validates :area_id, presence: true
  validates :days_id, presence: true  
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }
 
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}
end
