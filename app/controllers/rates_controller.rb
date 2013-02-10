class RatesController < ApplicationController
  def index
    @period = Period.first
    @student = current_user
    @current = Mark.new
  end

  def save
    @questions = params[:rate][:question_ids]
    @questions.each do |single_question|
      question_id = single_question[0]
      question_answers = single_question[1]

      question_answers.each do |single_student|
        student_id = single_student[0]
        mark_value = single_student[1]

        if(!mark_value.empty?)

          mark = Mark.where(:student_from_id => current_user,
                   :student_to_id => student_id,
                   :question_id => question_id,
                   :period_id => 1,
          ).first_or_initialize

          mark.value = mark_value
          mark.save
        end
      end
    end
    redirect_to rates_path
  end
end