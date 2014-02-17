class VideosController < ApplicationController
  self.before_action(:load_video, { only: [:show, :edit, :update, :destroy]})

  def index
    @jump = Jump.find(params[:jump_id])
    @videos = Video.all
  end

  def new
    @jump = Jump.find(params[:jump_id])
    @video = Video.new
  end

  def create
    @jump = Jump.find(params[:jump_id])
    @video = @jump.videos.create(video_params)
    redirect_to jump_videos_path
  end


  def destroy
    @video.destroy
    redirect_to jump_path(params[:jump_id])
  end

  def load_video
    return @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :video_url, :jump_id)
  end
end