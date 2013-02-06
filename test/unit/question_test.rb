require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "Question name must not be empty" do
    question = Question.new
    assert question.invalid?
    assert question.errors[:name].any?
  end
  
end

