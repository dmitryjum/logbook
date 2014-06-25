class SignaturesController < ApplicationController
  self.before_action :load_user
  self.before_action :load_signature, except: [:create, :index]
  before_action :authenticate, :authorize

  def index
    @signatures = @user.signatures.all
    render json: @signatures
  end

  def create
    @signature = @user.signatures.create(signature_params)
    render json: @signature
  end

  def update
    @signature.update(signature_params)
    render json: @signature
  end

  def destroy
    @signature.destroy
    respond_to do |format|
      format.html {redirect_to edit_user_path(@user)}
      format.json {render json: @images}
    end
  end

  private

  def signature_params
    params.require(:signature).permit(:code_url, :user_id)
  end

  def load_user
    return @user = User.find(params[:user_id])
  end

  def load_signature
    return @signature = Signature.find(params[:id])
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to root_path
    end
  end  
end