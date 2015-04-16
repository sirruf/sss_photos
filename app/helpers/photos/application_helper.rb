module Photos
  module ApplicationHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
      link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class, remote: true}
    end

    def get_devise_error(object, field)
      "#{object.class.human_attribute_name(field)} #{object.errors[field].join}" if object.errors[field].present?
    end

    def collapsed_link(menu_item)
      'collapse' unless menu_item.children.with_links.pluck(:link).include?(request.path)
    end

    def active_link(menu_item)
      'active' if request.path == menu_item.link
    end

    def left_menu_visible?
      if defined?(menu).present?
        Menu::MenuItem.roots.all_visible.count > 0
      else
        false
      end
    end

    def bootstrap_class_for flash_type
      {success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info'}[flash_type] || flash_type.to_s
    end

    def flash_messages(opts = {})
      flash.each do |msg_type, message|
        concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
                 concat content_tag(:button, 'x', class: 'close', data: {dismiss: 'alert'})
                 concat message
               end)
      end
      nil
    end

  end
end
include FontAwesome::Rails::IconHelper
