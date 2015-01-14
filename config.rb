###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :nest
  config.line_comments = false
end
require 'compass-normalize'
require 'breakpoint'
require 'font-awesome-sass'

###
# Sprockets
###

after_configuration do
  sprockets.append_path "#{root}/components/"
end

###
# Page options, layouts, aliases and proxies
###

with_layout :layout do
  page "/*", :layout => "layout"
  page "/articles*.json", :layout => false
end

###
# Helpers
###

helpers do
  def lang(path)
    I18n.locale.to_s + "/" + path
  end
end

set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, gh_blockcode: true, fenced_code_blocks: true, with_toc_data: true, smartypants: true, fenced_code_blocks: true
activate :syntax, :line_numbers => true

activate :automatic_image_sizes

set :css_dir, 'style'
set :js_dir, 'js'
set :images_dir, 'images'
set :slim, { pretty: true, sort_attrs: false, format: :html }
Tilt::CoffeeScriptTemplate.default_bare = true

#deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build = true
end

configure :build do
  # activate :minify_css
  # activate :minify_javascript
  # activate :asset_hash
  activate :relative_assets
  # set :http_prefix, "/Content/images/"
end
