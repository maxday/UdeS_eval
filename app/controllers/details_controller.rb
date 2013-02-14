class DetailsController < ApplicationController

  def index
    authorize! :check, :evaluation
    @period = Period.find(params[:period_id])
    @student = User.find(params[:user_id])
  end

  def export

  end

end
