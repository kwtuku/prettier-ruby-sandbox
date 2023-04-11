module Admins
  class UsersController < Admins::ApplicationController
    def index
      @users = User.order(created_at: :desc)
    end
  end
end
