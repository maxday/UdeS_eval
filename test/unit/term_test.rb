require 'test_helper'

class TermTest < ActiveSupport::TestCase

  test "Term name and year_id must not be empty" do
    term = Term.new
    assert term.invalid?
    assert term.errors[:name].any?
    assert term.errors[:year_id].any?
  end

  test "Only one term may be activated" do
    term = Term.first
    term.activate
    assert_equal Term.where(:is_active => true).count, 1
    assert_equal Term.where(:is_active => false).count, (Term.all.count - 1)
  end


end
