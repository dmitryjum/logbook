class VideosController < ApplicationController
  self.before_action(:load_user)
  self.before_action(:load_jump)
  self.before_action(:load_video, { only: [:show, :edit, :update, :destroy]})
  before_action :authorize_index, only: [:index]
  before_action :authenticate, :authorize, only: [:new, :show, :edit, :update, :destroy, :create]

  def index
    @video = Video.new
    @videos = @jump.videos.all
  end

  def new
    @video = Video.new
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

  
   def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize_index
    unless (current_user == @user)
      redirect_to root_path
    end
  end

  def authorize
    unless current_user.id == @jump.user_id
      redirect_to root_path
    end
  end
end