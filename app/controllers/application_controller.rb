class ApplicationController < ActionController::Base
  protect_from_forgery

  #users are required to be logged everywhere
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "Vous n'avez pas les droits suffisants <br />Action = #{exception.action} sur objet = #{exception.subject.class.name}"
  end

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
