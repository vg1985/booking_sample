require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test 'requires first and last name' do
    customer = Customer.new
    customer.validate
    refute_empty customer.errors[:first_name]
    refute_empty customer.errors[:last_name]

    customer.first_name = 'first'
    customer.last_name = 'last'
    customer.validate
    assert_empty customer.errors[:first_name]
    assert_empty customer.errors[:last_name]
  end

end
