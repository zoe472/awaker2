class Brand < ApplicationRecord
  has_many :tweets

  def self.brandsearch(search)
    @brand = Brand.find_by(['name LIKE ?', "%#{search}%"])
    if @brand.present?
      Tweet.where(['brand_id LIKE ?', "%#{@brand.id}%"])
    end
  end

end
