class PicturesController < ApplicationController
  self.before_action(:load_picture, { only: [:show, :edit, :update, :destroy] })
  self.before_action(:load_jump, {only: [:new, :create]})
  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picutre = @jump.pictures.create(picture_params)
    redirect_to jump_path(params[:jump_id])
  end

  def destroy
    @picture.destroy
    redirect_to "/jumps/#{params[:jump_id]}"
  end

  private

  def load_jump
    return @jump = Jump.find(params[:jump_id])
  end

  def load_picture
    return @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:name, :picture_url, :jump_id)
  end
end