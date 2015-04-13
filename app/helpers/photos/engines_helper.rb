module Photos
  module EnginesHelper
    def photos_module_enabled?
      defined?(photos).present?
    end

    def resource_link(resource)
      if resource.present?
        if resource.is_a?(Photos::Gallery)
          link_to polymorphic_path([photos, :admin, resource]), polymorphic_path([photos, :admin, resource]) if defined?(photos).present?
        else
          link_to polymorphic_path(resource), polymorphic_path([:admin, resource])
        end
      end
    end
  end
end
