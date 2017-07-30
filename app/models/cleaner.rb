class Cleaner < ActiveRecord::Base

  has_and_belongs_to_many :cities
  has_many :bookings

  before_validation :sanitize_email, if: :email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :quality_score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :email, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end

private

  DISALLOWED_CHARACTERS = [' '] # Add more if needed.

  def sanitize_email
    self.email.tr!(DISALLOWED_CHARACTERS.join, '')
  end
end
