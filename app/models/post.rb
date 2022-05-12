class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :member, optional: true
  has_many :replies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  def self.search(search_word)
    Post.where(['tag LIKE ?', "#{search_word}"])
  end
end
