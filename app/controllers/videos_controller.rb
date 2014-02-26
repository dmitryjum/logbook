class VideosController < ApplicationController
  self.before_action(:load_video, { only: [:show, :edit, :update, :destroy]})
  self.before_action(:load_jump, {only: [:index, :new, :create, :destroy]})
  self.before_action(:load_user)
  def index
    @video = Video.new
    @videos = @jump.videos.all
  end

  def create
    @video = @jump.videos.create(video_params)
    redirect_to user_jump_videos_path
  end


  def destroy
    @video.destroy
    redirect_to user_jump_path(params[:user_id], params[:jump_id])
  end

  private

  def load_user
    return @user = User.find(params[:user_id])
  end

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