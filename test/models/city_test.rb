require 'test_helper'

class CityTest < ActiveSupport::TestCase

  test 'requires name' do
    city = City.new
    city.validate
    refute_empty city.errors[:name]

    city.name = 'name'
    city.validate
    assert_empty city.errors[:name]
  end

end
