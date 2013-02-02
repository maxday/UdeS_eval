class HomeController < ApplicationController

  def index
    @role_name = Role.find(current_user.role_ids.first).name
  end

end
