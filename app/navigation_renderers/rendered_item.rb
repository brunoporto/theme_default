require 'forwardable'

module ThemeDefaultRenderers

  class RenderedItem
    extend Forwardable

    attr_reader :renderer
    def_delegators :renderer, :link_to, :content_tag, :include_sub_navigation?, :render_sub_navigation_for

    def initialize( renderer, item, level )
      @renderer = renderer
      @item = item
      @level = level

      @options = item.html_options
      @navbar_text = options.delete(:navbar_text)
      @divider = options.delete(:divider)
      @header = options.delete(:header)
      @link_options = options.delete(:link) || {}
    end

    def to_s
      if navbar_text
        li_text
      elsif divider
        li_divider
      elsif header && (level != 1)
        li_header
      else
        li_link
      end
    end

    private

    attr_reader :item, :level, :options, :navbar_text, :divider, :header, :link_options

    def li_text
      content_tag(:li, content_tag(:p, item.name, {class: 't'}), options)
    end

    def li_divider
      options[:class] = [ options[:class], ((level == 1) ? "divider-vertical" : "divider") ].flatten.compact.join(' ')
      content_tag(:li, '', options)
    end

    def li_header
      options[:class] = [options[:class], 'x'].flatten.compact.join(' ')
      content_tag(:li, item.name, options)
    end

    def li_link
      if include_sub_navigation?(item)
        if level == 1
          options[:class] = [options[:class], 'has-submenu'].flatten.compact.join(' ')
          content_tag(:li, dropdown_menu_link, options)
        else
          options[:class] = [options[:class], 'has-submenu'].flatten.compact.join(' ')
          content_tag(:li, dropdown_submenu_link, options)
        end
      else
        options[:class] = [options[:class], 'z'].flatten.compact.join(' ')
        content_tag(:li, simple_link, options)
      end
    end

    def dropdown_menu_link
      link_to(item_icon, "#", link_options ) + render_sub_navigation_for(item)
    end

    def dropdown_submenu_link
      simple_submenu_link + render_sub_navigation_for(item)
    end

    def item_url
      item.url || "#"
    end

    def item_icon
      i = options[:icon_class].present? ? content_tag(:i, nil, class: options[:icon_class]) : ''
      i + content_tag(:span, item.name)
    end

    def simple_submenu_link
      link_options[:method] ||= item.method
      link_to(item.name, item_url, link_options)
    end

    def simple_link
      link_options[:method] ||= item.method
      link_to(item.name, item_url, link_options)
    end

  end

end