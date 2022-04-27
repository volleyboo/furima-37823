class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヴー]+\z/u}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヴー]+\z/u}
  validates :birthday, presence: true

  #has_many :contents
  #has_many :purchases


  
end

