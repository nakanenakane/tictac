class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :results

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: true },format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true,length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }# ここが文字数の正規表現、パスワードの正規表現
end
