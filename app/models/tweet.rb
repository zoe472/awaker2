class Tweet < ApplicationRecord

  validates :catchcopy, :text, :category_id, :brand_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :toukouimages, dependent: :destroy
  accepts_nested_attributes_for :toukouimages, allow_destroy: true
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates_associated :toukouimages
  validates :toukouimages, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where(['catchcopy LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
  end

  

  def save_tags(tag_list)
    tag_list.each do |tag|
      unless find_tag = Tag.find_by(tag_name: tag.downcase)
        begin
          self.tags.create!(tag_name: tag)
        rescue
          nil
        end
      else
        TweetTagRelation.create!(tweet_id: self.id, tag_id: find_tag.id)
      end
    end
  end
end
