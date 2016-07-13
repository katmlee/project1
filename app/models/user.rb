class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :destinations
  has_many :photos, :through => :destinations

  def destination_coordinates
    destinations.map do |destination|
      { lat: destination.latitude , lng: destination.longitude }
    end
  end
end
