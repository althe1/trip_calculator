class Car < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :odometer
end
