class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :level
  has_many :choise
  #mount_uploader :image, ImageUploader

end
