class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :member, optional: true
  # has_many :favorite, dependent: :destroy
end
