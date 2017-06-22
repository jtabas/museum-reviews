class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile Updated Successfully"
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
      flash[:notice] = "Please enter correct passord to save changes"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to museums_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :username, :city, :state, :admin)
  end
end
