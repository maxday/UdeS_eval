require 'test_helper'

class TermTest < ActiveSupport::TestCase

  test "Term name must not be empty" do
    term = Term.new
    assert term.invalid?
    assert term.errors[:name].any?
  end


end
