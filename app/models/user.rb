class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => true
  has_many :destinations
  has_many :photos, :through => :destinations

  def self.koala(auth)
      access_token = auth['token']
      facebook = Koala::Facebook::API.new(access_token)
      facebook.get_object("me?fields=first_name,last_name,age_range,picture,locale,bio,email,photos")
  end

  def destination_coordinates
    destinations.map do |destination|
      { lat: destination.latitude , lng: destination.longitude }
    end
  end
end
