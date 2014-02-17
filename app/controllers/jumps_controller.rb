class JumpsController < ApplicationController
  self.before_action(:load_jump, { only: [:show, :edit, :update, :destroy] })

  def index
    @jumps = Jump.all
  end

  def new
    @jump = Jump.new
  end

  def create
    @jump = Jump.create(jump_params)
    redirect_to jumps_path
  end

  def show
    @videos = Video.all
    @pictures = @jump.pictures.all
  end

  def edit
  end

  def update
    @jump.update(jump_params)
    redirect_to jumps_path
  end

  def destroy
    @jump.destroy
    redirect_to jumps_path
  end

  private

  def load_jump
    return @jump = Jump.find(params[:id])
  end

  def jump_params
    params.require(:jump).permit(:jump_number, :date, :location,
      :freefall_time, :equipment, :aircraft, :total_freefall_time,
      :notes)
  end

end