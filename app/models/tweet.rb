class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :toukouimages
  accepts_nested_attributes_for :toukouimages, allow_destroy: true
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :category, presence: true

  def self.search(search)
    if search == "メンズ" or search == "レディース" or search == "キッズ" or search == "パーカー" or search == "スウェット" or search == "Tシャツ" or search == "ロンパース" or search == "アウター"
      return Tweet.all unless search 
      Tweet.where('category LIKE(?)', "%#{search}%")
    else
      return Tweet.all unless search
      Tweet.where('text LIKE(?)', "%#{search}%")
    end
  end
end
