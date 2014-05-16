class Photo < ActiveRecord::Base
  attr_accessor :location, :type, :click_date
  validates_presence_of :location
end

