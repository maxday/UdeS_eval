require 'test_helper'

class MarkTest < ActiveSupport::TestCase

  test "Mark can't be self-given" do
    mark = Mark.new(:student_from_id => 1, :student_to_id =>1)
    assert mark.invalid?
    assert mark.errors[:student_from_id].any?
    assert mark.errors[:student_to_id].any?
  end

end
