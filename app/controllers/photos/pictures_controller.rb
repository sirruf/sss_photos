module Photos
  class PicturesController < ApplicationController
    before_action :set_picture, only: [:show]

    def show
    end

    private

    def set_picture
      @picture = Picture.find(params[:id])
    end
  end
end
