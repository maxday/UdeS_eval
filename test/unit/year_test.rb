require 'test_helper'

class YearTest < ActiveSupport::TestCase

  test "Year name must not be empty" do
    year = Year.new
    assert year.invalid?
    assert year.errors[:name].any?
  end


  test "Year name must be unique" do
    year = Year.new(:name => "a")
    assert year.valid?
    year.save
    year = Year.new(:name => "a")
    assert year.invalid?
  end
end
