class VideosController < ApplicationController
  self.before_action(:load_video, { only: [:show, :edit, :update, :destroy]})
  self.before_action(:load_jump, {only: [:index, :new, :create]})

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = @jump.videos.create(video_params)
    redirect_to jump_videos_path
  end


  def destroy
    @video.destroy
    redirect_to jump_path(params[:jump_id])
  end

  private

  def load_jump
    return @jump = Jump.find(params[:jump_id])
  end

  def load_video
    return @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :video_url, :jump_id)
  end
end