
app_path = File.expand_path('../../app', __FILE__)
Rails.application.config.assets.paths << "#{app_path}/app/assets/plugins"

Rails.application.config.assets.precompile += %w( theme_default.js theme_default.css )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)\z/

# Rails.application.config.assets.precompile += %w( login_default.* login_default/* )