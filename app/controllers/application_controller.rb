class ApplicationController < ActionController::Base
  alias admin_root_path admins_root_path
  alias user_root_path users_root_path

  private

  def after_sign_out_path_for(resource_or_scope)
    new_session_path(resource_or_scope)
  end
end
