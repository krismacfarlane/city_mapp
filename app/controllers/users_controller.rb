class UsersController < ApplicationController
  before_action(:authenticate, :except => [:new, :create])

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password,
        :authenticity_token
      )
  end

end
