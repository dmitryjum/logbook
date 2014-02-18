class UsersController < ApplicationController
before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    render(:new)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :first_name, :last_name, :dob, :license_number)
  end
end