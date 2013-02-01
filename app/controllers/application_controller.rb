class ApplicationController < ActionController::Base
  protect_from_forgery

  #users are required to be logged everywhere
  before_filter :authenticate_user!
end
