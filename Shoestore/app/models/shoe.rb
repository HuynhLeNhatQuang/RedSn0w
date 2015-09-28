class Shoe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  mount_uploader :image, ImageUploader
  is_impressionable
def self.search(search, page)
  order('name').where('name LIKE ?', "%#{search}%").paginate(page: page, per_page: 3)
end
end
