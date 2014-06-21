class JumpsController < ApplicationController
  self.before_action(:load_jump, {only: [:show, :edit, :update, :unshare, :destroy] })
  self.before_action(:load_user, {only: [:index, :new, :create, :jumps_of_the_day]})
  self.before_action(:load_jump_user, {only: [:show, :edit, :update, :unshare, :destroy]})
  before_action :authorize_index, only: [:index, :new, :jumps_of_the_day]
  before_action :authenticate, :authorize, only: [ :show, :edit, :update, :destroy]

  def index
    @jumps = @user.jumps.all
  end

  def new
    @jump = @user.jumps.new
  end

  def create
    @jump = @user.jumps.create(jump_params)
    redirect_to user_jumps_path(params[:user_id])
  end

  def show
    @picture = Picture.new
    @videos = Video.all
    @pictures = @jump.pictures.all
    @jump.shared_users
  end

  def edit

  end

  def update
    shared_users = User.where(id: params[:jump][:shared_users])
    shared_users.each do |user|
      @jump.shared_users << user
    end
    @jump.update(jump_params)
    redirect_to jump_path
  end

  def unshare
    jump_user = User.where(id: params[:jump_user_id])
    @jump.shared_users.each do |user|
      @jump.shared_users.delete(jump_user)
    end
    redirect_to jump_path
  end

  def destroy
    @user = @jump.user_id
    @jump.destroy
    redirect_to user_jumps_path(@user)
  end

  def jumps_of_the_day
    @jumps = Jump.all
    @my_jumps = Jump.all.where(user_id: @user.id ,date: params[:date])
    @other_jumps = Jump.all.where.not(user_id: @user.id) && Jump.all.where(date: params[:date])
    binding.pry
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def load_jump_user
    return @user = User.find_by(id: @jump.user_id)
  end

  def load_jump
    return @jump = Jump.find(params[:id])
  end

  def jump_params
    params.require(:jump).permit(:jump_number, :date, :location,
      :freefall_time, :equipment, :aircraft, :total_freefall_time,
      :notes, :exit_altitude, :user_id)
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end
# write second authorize method to prevent error when I access user.id/jumps with not authorized user
  def authorize_index
    unless (current_user == @user)
      redirect_to root_path
    end
  end

  def authorize
    # unless this jump belongs to the current_user
    # OR the current user has been shared this jump AND this is the show page,
    # redirect to root
    unless (current_user == @user) || 
           (@jump.shared_users.include?(current_user) && action_name == "show")
      redirect_to root_path
    end
  end

end