class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    dashboard_profile_edit_path(resource)
  end
end
