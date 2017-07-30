require 'test_helper'

class CleanerTest < ActiveSupport::TestCase

  test 'requires first and last name' do
    cleaner = Cleaner.new
    cleaner.validate
    refute_empty cleaner.errors[:first_name]
    refute_empty cleaner.errors[:last_name]

    cleaner.first_name = 'first'
    cleaner.last_name = 'last'
    cleaner.validate
    assert_empty cleaner.errors[:first_name]
    assert_empty cleaner.errors[:last_name]
  end

  [
    '',
    'abc',
    -1,
    5.1,
  ].each do |invalid_value|
    test "example quality_score of #{invalid_value.inspect} is invalid" do
      cleaner = Cleaner.new(quality_score: invalid_value)
      cleaner.validate
      refute_empty cleaner.errors[:quality_score]
    end
  end

  test 'requires quality_score to be between 0.0 and 5.0' do
    cleaner = Cleaner.new(quality_score: 5.0)
    cleaner.validate
    assert_empty cleaner.errors[:quality_score]
  end

  test 'email is required' do
    cleaner = Cleaner.new
    cleaner.validate
    refute_empty cleaner.errors[:email]

    cleaner.email = 'asdf@asdf.com'
    cleaner.validate
    assert_empty cleaner.errors[:email]
  end

  test 'email is sanitized before validating' do
    cleaner = Cleaner.new(email: ' asdf @ asdf . com')
    cleaner.validate
    assert_equal 'asdf@asdf.com', cleaner.email
  end

end
