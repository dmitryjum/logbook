class PictureController < ApplicationController
  self.before_action(:load_picture, { only: [:show, :edit, :update, :destroy] })
  def show
    render(:show)
  end

  def destroy
    @picture.destroy
    redirect_to jump_path
  end

  private

  def load_picture
    return @picture = Picture.find(params[:id])
  end
end