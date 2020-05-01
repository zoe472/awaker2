class Category < ApplicationRecord
  has_many :tweets

  def self.categorysearch(search)
    @category = Category.find_by(['name LIKE ?', "%#{search}%"])
    if @category.present?
      Tweet.where(['category_id LIKE ?', "%#{@category.id}%"])
    end
  end
end
