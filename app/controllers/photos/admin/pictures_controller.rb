module Photos
  module Admin
    class PicturesController < ApplicationController
      # noinspection RailsParamDefResolve
      before_filter :authenticate_admin! if defined? Devise
      before_action :set_picture, only: [:show, :destroy, :up_position, :down_position, :first_position, :last_position, :edit_name]
      before_action :set_gallery, only: [:up_position, :down_position, :first_position, :last_position]

      layout 'admin/control'

      def show
        @gallery = @product_image.product
      end

      def create
        gallery = Gallery.find_by(id: params[:picture][:gallery_id])
        if gallery.present?
          @image = gallery.pictures.new(picture_params)
          unless @image.save
            flash[:error] = 'Error. Image not saved.'
          end
        end
      end

      def destroy
        @picture.destroy
      end

      def up_position
        @picture.decrement_position
        render 'reload_images'
      end

      def down_position
        @picture.increment_position
        render 'reload_images'
      end

      def first_position
        @picture.move_to_top
        render 'reload_images'
      end

      def last_position
        @picture.move_to_bottom
        render 'reload_images'
      end

      def edit_name
        @picture.update(name: params[:picture][:name])
      end

      private

      def set_picture
        @picture = Picture.find(params[:id])
      end

      def set_gallery
        @gallery = Gallery.find(params[:gallery_id])
        @gallery_images = @gallery.pictures.order(:position)
      end

      def picture_params
        params.require(:picture).permit(:image, :gallery_id)
      end

    end
  end
end