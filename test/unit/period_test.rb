require 'test_helper'

class PeriodTest < ActiveSupport::TestCase

  test "Period name must not be empty" do
    period = Period.new
    assert period.invalid?
    assert period.errors[:name].any?
  end
  
end
