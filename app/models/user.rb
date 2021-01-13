class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable
  #        :recoverable, :rememberable, :validatable
  has_many :results

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, presence: true, confirmation: true,length: { minimum: 7 }

  # def email_required?
  #   false
  # end
  # def email_changed?
  #   false
  # end

end
