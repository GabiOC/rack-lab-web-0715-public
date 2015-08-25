require 'pry'

class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == '/about'
      # template = File.read('lib/templates/about.html.erb')
      template = "<h1><a href='/'>Are you lost?</a></h1>"
    else
      template = File.read('lib/templates/index.html.erb')
    end
    result = ERB.new(template).result(binding)
    Rack::Response.new(result)
  end
end
