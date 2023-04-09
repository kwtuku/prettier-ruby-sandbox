module Users
  class InvitationsController < Devise::InvitationsController
    layout "users/application", only: %i[new create]

    private

    def after_invite_path_for(_inviter, _invitee)
      users_users_path
    end
  end
end
