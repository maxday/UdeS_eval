class EvaluationsController < ApplicationController

  def index
    authorize! :check, :evaluation
    @periods = Period.all
    @current = Period.new
  end

  def show
    authorize! :check, :evaluation
    @period = Period.find(params[:id])

    @students = User.only_students
    @affectation = Affectation.where(:term_id => @period.term_id, :user_id => @students).pluck(:user_id)
    @students = User.where(:id => @affectation)

    if @students.count == 0
      respond_to do |format|
          format.html { redirect_to evaluations_path, notice: 'Aucun etudiant dans cette session.' }
      end
    end

  end

  def select
    authorize! :check, :evaluation
    redirect_to evaluation_path(Period.find(params[:period][:period_id]))
  end

end