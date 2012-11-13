class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
    # render "galleries/index" #по умолчанию рендерит на соотв.въюху, можн. не указывать

  end

  # /Galleries/1 GET
  def show
    unless @gallery = Gallery.where(id: params[:id]).first

      render text: "Page not found", status:404
    end
  end

  # /Galleries/new GET
  def new
    @gallery = Gallery.new

  end

  # /Galleries/1/edit GET
  def edit
  end

  # /Galleries POST
  def create
    @gallery = Gallery.create(params[:gallery])
    if @gallery.errors.empty?
      redirect_to gallery_path(@gallery)
    else
      render "new"
    end

    #-render text: params.inspect
  end

  # /Galleries/1 PUT
  def update
  end

  # /Galleries/1 DELETE
  def destroy
  end

end
