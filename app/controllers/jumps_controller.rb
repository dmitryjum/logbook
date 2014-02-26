class JumpsController < ApplicationController
  self.before_action(:load_jump, {only: [:show, :edit, :update, :destroy] })
  self.before_action(:load_user, {only: [:index, :show, :new, :edit, :create]})


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
    @jumps = @user.jumps.all
    @videos = Video.all
    @pictures = @jump.pictures.all
  end

  def edit
  end

  def update
    @jump.update(jump_params)
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

end