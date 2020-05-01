class Tag < ApplicationRecord
  
  before_save :downcase_tag_name
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tweets, through: :tweet_tag_relations
  validates :tag_name, uniqueness: true, length: { maximum: 50 }
  private

  def downcase_tag_name
    self.tag_name.downcase!
  end

  def self.tagsearch(search)
    @tag = Tag.find_by(['tag_name LIKE ?', "%#{search}%"])
    if @tag.present?
      Tweet.left_joins( :tweet_tag_relations ).where(['tag_id LIKE ?', "%#{@tag.id}%"])
    end
  end
end
