class PictureCommentsController < ApplicationController
  self.before_action(:load_picture)
  self.before_action(:load_jump)
  self.before_action(:load_user)
  self.before_action(:load_comment, {except: :create})
  before_action :authenticate, :authorize

  def create
    @comment = @picture.picture_comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      render json: [@comment, @comment.user]
    else
      render status: 400, nothing: true
    end
    # redirect_to picture_path(params[:picture_id], jump_id: @jump.id)
  end

  def update
    @comment.update(comment_params)
    redirect_to picture_path
  end

  def destroy
    @comment.destroy
    # redirect_to picture_path(id: @picture.id, jump_id: @jump.id)
    if @comment.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private


  def load_jump
    return @jump = Jump.find(@picture.jump_id)
  end

  def load_user
    return @user = User.find(@jump.user_id)
  end

  def load_picture
    return @picture = Picture.find(params[:picture_id])
  end

  def load_comment
    return @comment = PictureComment.find(params[:id])
  end

  def comment_params
    params.require(:picture_comment).permit(:comment, :picture_id, :user_id)
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    unless (current_user == @user) || (@jump.shared_users.include?(current_user))
      redirect_to root_path
    end
  end

end