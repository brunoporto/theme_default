require 'rendered_item'

module SimpleNavigation
  module Renderer

    class ThemeDefaultRenderer < SimpleNavigation::Renderer::Base

      def render(item_container)
        if skip_if_empty? && item_container.empty?
          ''
        else
          list_content = with_bootstrap_configs do
            item_container.items.inject([]) do |list, item|
              list << ThemeDefaultRenderers::RenderedItem.new(self, item, item_container.level).to_s
            end.join
          end
          item_container.dom_class = [ item_container.dom_class, container_class(item_container.level) ].flatten.compact.join(' ')
          content_tag(:ul, list_content, {id: item_container.dom_id, class: item_container.dom_class})
        end
      end

      private

      def container_class(level)
        if level == 1
          'navigation-menu'
        else
          'submenu'
        end
      end

      def with_bootstrap_configs
        sn_config = SimpleNavigation.config
        config_selected_class = sn_config.selected_class
        config_name_generator = sn_config.name_generator
        # sn_config.selected_class = "active"
        # name_generator should be proc (not lambda or method) to be compatible with earlier versions of simple-navigation
        sn_config.name_generator = proc do |name, item|
          config_name_generator.call(name, item)
        end

        result = yield

        sn_config.name_generator = config_name_generator
        sn_config.selected_class = config_selected_class

        result
      end

    end
  end
end