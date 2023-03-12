class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders
  # has_many :comments

  with_options presence: true do

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }   
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }  
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
