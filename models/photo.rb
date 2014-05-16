load 'db/connection.rb'

class Photo < ActiveRecord::Base
  validates_presence_of :location
end

