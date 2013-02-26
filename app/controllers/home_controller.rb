class HomeController < ApplicationController

  before_filter :check_if_first_time

  def index
    @role_name = Role.find(current_user.role_ids.first).name
  end

  def check_if_first_time
    logger.info current_user.sign_in_count
    if current_user.sign_in_count == 1
      redirect_to edit_user_registration_path
    end
  end

end
