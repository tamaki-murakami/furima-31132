class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  EISU_MIX_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  WIDE_REGEX = /\A[ァ-ヶー－ぁ-ん一-龥]+\z/.freeze
  WIDE_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :email, uniqueness: true
  validates :password, format: { with: EISU_MIX_REGEX }
  with_options presence: true do
    validates :nick_name
    validates :birthday
    validates :family_name, format: { with: WIDE_REGEX }
    validates :last_name, format: { with: WIDE_REGEX, }
    validates :family_kana, format: { with: WIDE_KATAKANA_REGEX, }
    validates :last_kana, format: { with: WIDE_KATAKANA_REGEX, }
  end

  has_many :items
  has_many :orders
  
end
