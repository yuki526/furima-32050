class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'Include both letters and numbers' }
    validates :nickname
    validates :birth_date
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: ' Full-width katakana characters' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: ' Full-width katakana characters' }
  end
end
