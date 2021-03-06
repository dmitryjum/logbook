class UsersController < ApplicationController
before_action :load_user, only: [:show, :edit, :update, :destroy, :remove_avatar]
before_action :authenticate, :authorize, only: [:show, :edit, :update]
  def new
    @user = User.new
    render(:new)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    # @jump_sign = Signature.find_by(id: @jump.signature_id)
    @signature = @user.signatures.first
  end

  def edit
    @update_worked = true
  end

  def update
    @update_worked = @user.update(user_params)

    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  def remove_avatar
    @user.avatar = nil
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    session.destroy
    redirect_to root_path
  end


  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :first_name, :last_name, :dob, :license_number, :avatar)
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to root_path
    end
  end
end