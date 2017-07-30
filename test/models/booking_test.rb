require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  test 'requires customer' do
    booking = Booking.new
    booking.validate
    refute_empty booking.errors[:customer]

    booking.customer = customers(:one)
    booking.validate
    assert_empty booking.errors[:customer]
  end

  test 'requires cleaner' do
    booking = Booking.new
    booking.validate
    refute_empty booking.errors[:cleaner]

    booking.cleaner = cleaners(:mr_clean)
    booking.validate
    assert_empty booking.errors[:cleaner]
  end

  test 'requires date' do
    booking = Booking.new
    booking.validate
    refute_empty booking.errors[:date]

    booking.date = Date.today
    booking.validate
    assert_empty booking.errors[:date]
  end

end
