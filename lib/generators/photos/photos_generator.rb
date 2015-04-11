class PhotosGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  def copy_views_files
    # Layouts
    copy_file 'layouts/photos/application.html.erb', 'app/views/layouts/photos/application.html.erb'
    copy_file 'layouts/admin/control.html.erb', 'app/views/layouts/admin/control.html.erb'
    copy_file 'layouts/admin/_nav_bar.html.erb', 'app/views/layouts/admin/_nav_bar.html.erb'
    # Admin Galleries
    copy_file 'photos/admin/galleries/index.html.erb', 'app/views/photos/admin/galleries/index.html.erb'
    copy_file 'photos/admin/galleries/_galleries.html.erb', 'app/views/photos/admin/galleries/_galleries.html.erb'
    copy_file 'photos/admin/galleries/_form.html.erb', 'app/views/photos/admin/galleries/_form.html.erb'
    copy_file 'photos/admin/galleries/edit.html.erb', 'app/views/photos/admin/galleries/edit.html.erb'
    copy_file 'photos/admin/galleries/new.html.erb', 'app/views/photos/admin/galleries/new.html.erb'
    copy_file 'photos/admin/galleries/show.html.erb', 'app/views/photos/admin/galleries/show.html.erb'
    # Admin Pictures
    copy_file 'photos/admin/pictures/create.js.erb', 'app/views/photos/admin/pictures/create.js.erb'
    copy_file 'photos/admin/pictures/destroy.js.erb', 'app/views/photos/admin/pictures/destroy.js.erb'
    copy_file 'photos/admin/pictures/edit_name.js.erb', 'app/views/photos/admin/pictures/edit_name.js.erb'
    copy_file 'photos/admin/pictures/first_position.js.erb', 'app/views/photos/admin/pictures/first_position.js.erb'
    copy_file 'photos/admin/pictures/reload_images.js.erb', 'app/views/photos/admin/pictures/reload_images.js.erb'
    copy_file 'photos/admin/pictures/show.html.erb', 'app/views/photos/admin/pictures/show.html.erb'
    # Galleries
    copy_file 'photos/galleries/index.html.erb', 'app/views/photos/galleries/index.html.erb'
    copy_file 'photos/galleries/show.html.erb', 'app/views/photos/galleries/show.html.erb'
    copy_file 'photos/pictures/_picture.html.erb', 'app/views/photos/pictures/_picture.html.erb'
  end
end
