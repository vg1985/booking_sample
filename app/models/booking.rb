class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner

  validates :customer, presence: true
  validates :cleaner, presence: true
  validates :date, presence: true
end
