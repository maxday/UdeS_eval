class RatesController < ApplicationController



  def index
    @student = current_user
    @current = Mark.new
    @term_ids_where_student_is_registered = Affectation.where(:user_id => @student).pluck(:term_id)
    @periods = Period.where(:term_id => @term_ids_where_student_is_registered)
    @current = Period.new
  end

  def show
    @period = Period.find(params[:id])
    session[:period_id] = @period
    @current = Mark.new
    @available_marks = Entry.where(:period_id => @period)
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
                   :period_id => session[:period_id].id,
          ).first_or_initialize

          mark.value = Entry.find(mark_value).real_value
          mark.save
        end
      end
    end
    redirect_to rate_path(session[:period_id].id)
  end

  def select
    redirect_to rate_path(Period.find(params[:period][:period_id]))
  end

end