module Admins
  class UsersController < Admins::ApplicationController
    def index
      @q = User.ransack(params[:q])
      @q.sorts = "created_at desc" if @q.sorts.empty?
      @users = @q.result(distinct: true).page(params[:page])
    end
  end
end
