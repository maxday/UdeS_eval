class DetailsController < ApplicationController
  def index
    @period = Period.find(params[:period_id])
    @student = User.find(params[:user_id])
  end

end
