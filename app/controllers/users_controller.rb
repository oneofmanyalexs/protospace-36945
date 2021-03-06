class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:email, :password, :user_name, :email, :profile, :occupation, :position))
    @user.save
    redirect_to users_path
  end

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @prototypes = current_user.prototypes
  end
end
