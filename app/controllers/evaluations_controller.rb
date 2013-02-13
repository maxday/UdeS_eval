class EvaluationsController < ApplicationController

  authorize_resource :class => false

  def index
    @periods = Period.all
    @current = Period.new
  end

  def show
    @period = Period.find(params[:id])
    @students = User.only_students
  end

  def select
    redirect_to evaluation_path(Period.find(params[:period][:period_id]))
  end

end