#encoding: utf-8
class CommentsController < ApplicationController


  def new

  end

  def all_comm
    @comments = Comment.paginate(:page => params[:page], :per_page => 5).order("created_at ASC").all
    #@comments = Comment.order("created_at ASC").all
  end

  def create
    comment = current_user.comments.new(params[:comment])
    comment.save!
    redirect_to :back
  end
end


