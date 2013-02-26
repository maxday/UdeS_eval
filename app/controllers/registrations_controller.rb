class RegistrationsController < Devise::RegistrationsController

  def update
    # Devise use update_with_password instead of update_attributes.
    # This is the only change we make.
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, resource, :bypass => true
      logger.info "super kikoo"
      logger.info User.find(current_user).sign_in_count
      User.find(current_user).increment!(:sign_in_count)
      logger.info User.find(current_user).sign_in_count
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      redirect_to after_update_path_for(resource), :flash => { :alert => "Erreur : Votre mot de passe n'a pas ete change !" }
    end
  end

  private
  # Redirect to the URL after modifying Devise resource (Here, our user)
  def after_update_path_for(resource)
    home_path
  end
end