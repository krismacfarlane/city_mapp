class Map < ActiveRecord::Base

  belongs_to :user
  belongs_to :city
  has_many :markers

end
