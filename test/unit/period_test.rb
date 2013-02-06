require 'test_helper'

class PeriodTest < ActiveSupport::TestCase

  test "Period name and term_id must not be empty" do
    period = Period.new
    assert period.invalid?
    assert period.errors[:name].any?
    assert period.errors[:term_id].any?
  end
  
end
