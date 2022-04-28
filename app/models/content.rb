class Content < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  #belongs_to :user
  #has_one :purchase
  
  #商品画像を1枚つけることが必須であること。
  validates :image, presence: true
  #商品名が必須であること。
  validates :title, presence: true
  #商品の説明が必須であること。
  validates :explanation, presence: true
  #カテゴリーの情報が必須であること。
  validates :category, presence: true
  #カテゴリーは、「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目が表示されること（--- は初期値として設定すること）。
  
  #商品の状態の情報が必須であること。
  validates :state, presence: true
  #商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目が表示されること（--- は初期値として設定すること）。
  
  #配送料の負担の情報が必須であること。
  validates :charge, presence: true
  #配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目が表示されること（--- は初期値として設定すること）。
  
  #発送元の地域の情報が必須であること。
  validates :area, presence: true
  #発送までの日数の情報が必須であること。
  validates :days, presence: true
  #発送までの日数は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目が表示されること（--- は初期値として設定すること）。
  
  #価格の情報が必須であること。
  #価格は、¥300~¥9,999,999の間のみ保存可能であること。
  #価格は半角数値のみ保存可能であること。
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }, format: {with: /^[0-9]+$/}
  #入力された価格によって、販売手数料や販売利益の表示が変わること。
  
  #販売手数料と販売利益は、小数点以下を切り捨てて表示すること。
 
  #ジャンルの選択が「--」の時は保存できないようにする
  #validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}}

end
