module Photos
  class GalleriesController < ApplicationController
    before_action :set_gallery, only: [:show]

    def index
      @galleries = Gallery.published.paginate(:page => params[:page], :per_page => 20)
    end


    def show
      @pictures = @gallery.pictures.paginate(:page => params[:page], :per_page => 20)
    end

    private

    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

  end
end