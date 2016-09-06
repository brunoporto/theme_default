app_path = File.expand_path('../../../app', __FILE__)
require "#{app_path}/navigation_renderers/theme_default_renderer.rb"
SimpleNavigation.register_renderer theme_default_renderer: SimpleNavigation::Renderer::ThemeDefaultRenderer