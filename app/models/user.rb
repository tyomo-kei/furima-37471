class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}

  validates :nickname,           presence: true
  validates :last_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須' }
  validates :first_name,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須' }
  validates :last_name_kana,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力が必須' }
  validates :first_name_kana,    presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力が必須' }
  validates :date_of_birth,      presence: true

  

end
