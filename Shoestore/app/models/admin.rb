class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    def self.search(search, page)
  		order('name').where('name LIKE ?', "%#{search}%").paginate(page: page, per_page: 3)
	end
end
