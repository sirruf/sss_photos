module Photos
  module Admin
    class PicturesController < ApplicationController
      # noinspection RailsParamDefResolve
      before_filter :authenticate_admin! if defined? Devise
      before_action :set_picture, only: [:show, :destroy, :up_position, :down_position, :first_position, :last_position, :edit_name, :on_home_status, :resize]
      before_action :set_gallery, only: [:up_position, :down_position, :first_position, :last_position, :on_home_status]

      layout 'admin/control'

      def show
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

      def on_home_status
        if @picture.on_home
          @picture.update(on_home: false)
        else
          @picture.update(on_home: true)
        end
        render 'reload_images'
      end

      def resize
        @size = params[:picture][:image_size]
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