require 'test_helper'

class TermTest < ActiveSupport::TestCase

  test "Term name and year_id must not be empty" do
    term = Term.new
    assert term.invalid?
    assert term.errors[:name].any?
    assert term.errors[:year_id].any?
  end


end
