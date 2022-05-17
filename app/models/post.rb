class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :member, optional: true
  has_many :replies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  def self.search(word)
    Post.where(["title like? OR introduction like? OR machine like? OR tag like ?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%"])
  end

end
