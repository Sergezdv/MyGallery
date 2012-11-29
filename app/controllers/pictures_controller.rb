class PicturesController < ApplicationController

  def index
    @picture = Picture.all
  end

  def all_img
    @pictures = Picture.paginate(:page => params[:page], :per_page => 21).order("likes_count DESC")
  end

  def show
    @picture = Picture.includes(:comments).find(params[:id])
  end

  def like
    @picture = Picture.find(params[:id])
    unless @picture.likes.find_by_user_id(current_user.id)
      like = @picture.likes.build(:user_id => current_user.id)
      flash[:error] = "Error" unless like.save
    end
    redirect_to :back
  end

end
