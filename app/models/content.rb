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
  
  #商品画像を1枚つけることが必須であること。
  validates :image, presence: true
  #商品名が必須であること。
  validates :title, presence: true
  #商品の説明が必須であること。
  validates :explanation, presence: true
  #カテゴリーの情報が必須であること。
  validates :category_id, presence: true  
  #商品の状態の情報が必須であること。
  validates :state_id, presence: true  
  #配送料の負担の情報が必須であること。
  validates :charge_id, presence: true  
  #発送元の地域の情報が必須であること。
  validates :area_id, presence: true
  #発送までの日数の情報が必須であること。
  validates :days_id, presence: true  
  #価格の情報が必須であること。
  #価格は、¥300~¥9,999,999の間のみ保存可能であること。
  #価格は半角数値のみ保存可能であること。
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }
  #入力された価格によって、販売手数料や販売利益の表示が変わること。
  
  #販売手数料と販売利益は、小数点以下を切り捨てて表示すること。
 
  #ジャンルの選択が「--」の時は保存できないようにする
  #validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  #validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  #validates :charge:id, numericality: { other_than: 1 , message: "can't be blank"}
  #validates :area_id,  numericality: { other_than: 1 , message: "can't be blank"}
  #validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}
end
