module Admin
  class UsersController < ApplicationController
    def index
      if current_user.admin
        @users = User.all
      else
        redirect_to museums_path
        flash[:notice] = "You don't have access to this page!"
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :username,
        :city,
        :state,
        :admin,
        :avatar
      )
    end
  end
end
