module Photos
  module Admin
    class GalleriesController < ApplicationController
      before_filter :authenticate_admin! if defined? Devise
      helper_method :sort_column, :sort_direction
      before_action :set_gallery, only: [:show, :edit, :update, :destroy, :render_versions]

      layout 'admin/control'

      def index
        @galleries = Gallery.all.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        @gallery = Gallery.new
      end

      def show
        @gallery_images = @gallery.pictures.order(:position)
      end

      def edit
        @gallery_images = @gallery.pictures.order(:position)
      end

      def create
        @gallery = Gallery.new(gallery_params)

        respond_to do |format|
          if @gallery.save
            format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully created.' }
            format.json { render action: 'show', status: :created, location: @gallery }
          else
            format.html { render action: 'new' }
            format.json { render json: @gallery.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @gallery.update(gallery_params)
            format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @gallery.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @gallery.destroy
        respond_to do |format|
          format.html { redirect_to admin_galleries_url }
          format.json { head :no_content }
        end
      end

      def render_versions
        @gallery.pictures.each do |picture|
          picture.image.recreate_versions!
          picture.save!
        end
      end

      private

      def sort_column
        Gallery.column_names.include?(params[:sort]) ? params[:sort] : 'id'
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
      end

      def gallery_params
        params.require(:gallery).permit(:name, :description, :published)
      end

      def set_gallery
        @gallery = Gallery.find(params[:id])
      end

    end
  end
end