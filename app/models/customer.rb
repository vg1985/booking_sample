class Customer < ActiveRecord::Base
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end
end
