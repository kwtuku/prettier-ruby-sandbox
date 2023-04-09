module Admins
  module Users
    class InvitationsController < Devise::InvitationsController
      layout "admins/application", only: %i[new create]

      private

      def after_invite_path_for(_inviter, _invitee)
        admins_users_path
      end

      def authenticate_inviter!
        authenticate_admin!(force: true)
      end
    end
  end
end
