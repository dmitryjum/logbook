class VideosController < ApplicationController
  self.before_action(:load_jump)
  self.before_action(:load_user)
  self.before_action(:converturl, only: :create)
  self.before_action(:load_video, only: :destroy)
  before_action :authorize_index, only: [:index]
  before_action :authenticate, :authorize, only: [:new, :destroy, :create]

  def index
    @video = Video.new
    render :index, layout: false
  end

  def new
    @video = Video.new
  end

  def create
    @video = @jump.videos.create(video_params)
      respond_to do |format|
      format.html {redirect_to user_path(@user)}
      format.json {render json: @video}
    end
  end


  def destroy
    @video.destroy
    # redirect_to user_path(@user)
    if @video.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def load_user
    return @user = User.find(@jump.user_id)
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

  def converturl
    url = params[:video][:video_url]
    params[:video][:video_url] = url.gsub "watch?v=", "embed/"
  end
  
  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize_index
    unless (current_user == @user) || (action_name == "index" && @jump.shared_users.include?(current_user))
      redirect_to root_path
    end
  end

  def authorize
    unless current_user.id == @jump.user_id
      redirect_to root_path
    end
  end
end