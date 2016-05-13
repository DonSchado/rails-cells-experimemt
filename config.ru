require 'cells'
require 'cells-hamlit'
require 'action_controller/railtie'

class Page < Cell::ViewModel
  include Cell::Hamlit
  self.view_paths = ['.']
  self.layout :layout

  def show
    render
  end
end

class App < Rails::Application
  config.secret_key_base = 'secret'
  config.eager_load = true
  config.log_level = :debug
  config.api_only = true

  routes do
    root to: ->(env) { Rack::Response.new Page.().() }
  end
end

use Rack::Static, root: 'public', urls: %w[/images /js /css]
run App.initialize!
