require 'test_helper'

class PeriodTest < ActiveSupport::TestCase

  test "Period name and term_id must not be empty" do
    period = Period.new
    assert period.invalid?
    assert period.errors[:name].any?
    assert period.errors[:term_id].any?
  end

  test "Full name" do
    period = Period.first
    period_name = period.name
    term = Term.find(period.term_id)
    term_name = term.name
    year_name = Year.find(term.year_id).name
    assert_equal period.fullname, "#{year_name} - #{term_name} - #{period_name}"
  end

  test "All question" do
    period = Period.first
    question = Question.limit(2)
    Question.update_all(:period_id =>  nil)
    question.update_all(:period_id => period.id)
    assert_equal period.all_question.count, 2
  end
end
