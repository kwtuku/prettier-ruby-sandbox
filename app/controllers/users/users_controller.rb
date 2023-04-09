module Users
  class UsersController < Users::ApplicationController
    def index
      @users = User.order(created_at: :desc)
    end
  end
end
