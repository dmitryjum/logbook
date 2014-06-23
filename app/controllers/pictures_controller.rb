class PicturesController < ApplicationController
  self.before_action(:load_picture, { only: [:show, :edit, :update, :destroy] })
  self.before_action(:load_jump, {only: [:show, :new, :create, :destroy]})
  self.before_action(:load_user, {except: [:show, :destroy, :create]})
  before_action :authenticate, :authorize, only: [:create, :show, :edit, :update, :destroy]

  def show
    @comment = PictureComment.new
    # @user = User.find_by(id: @jump.user_id)
    @comments = @picture.picture_comments.all
  end

  def create
    @picutre = @jump.pictures.create(picture_params)
    redirect_to jump_path(params[:jump_id])
  end

  def destroy
    @picture.destroy
    redirect_to jump_path(params[:jump_id])
  end

  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def load_jump
    return @jump = Jump.find(params[:jump_id])
  end

  def load_picture
    return @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:name, :picture_url, :jump_id, :image_file)
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    #first part is to authorize user if he's the owner, second - to authorize only show for anybody else, third, to authrozie "only show" to only shared users
    unless current_user.id == @jump.user_id || (action_name == "show" && @picture.jump.shared_users.include?(current_user))
      redirect_to root_path
    end
  end
end