class Destination < ActiveRecord::Base
  belongs_to :user

  geocoded_by :place
  after_validation :geocode

  def place
    "#{city} #{country}"
  end
end
