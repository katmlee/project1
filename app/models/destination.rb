class Destination < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  geocoded_by :place
  after_validation :geocode

  def place
    "#{city} #{country}"
  end
end
