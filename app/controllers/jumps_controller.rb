class JumpsController < ApplicationController
  

  self.before_action(:load_jump, {only: [:show, :edit, :update, :unshare_jump, :destroy] })
  self.before_action(:load_user)
  before_action :authorize_index, only: [:index]
  before_action :authenticate, :authorize, only: [ :show, :edit, :update, :destroy]

  def index
    # @posts = Post.all.includes(:author)
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
    @jumps = @user.jumps.all
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
    redirect_to user_jumps_path(params[:user_id])
  end

  def unshare_jump
    jump_user = User.where(id: params[:jump_user_id])
    @jump.shared_users.each do |user|
      @jump.shared_users.delete(jump_user)
    end
    redirect_to user_jumps_path(params[:user_id])
  end

  def destroy
    @jump.destroy
    redirect_to user_jumps_path
  end

  private

  def load_user
    return @user = User.find(params[:user_id])
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