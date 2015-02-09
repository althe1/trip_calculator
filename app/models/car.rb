class Car < ActiveRecord::Base
  validates :name, presence: true
  validates :odometer, presence: true

  belongs_to :user
end
