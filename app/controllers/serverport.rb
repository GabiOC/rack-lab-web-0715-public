class ServerPort
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    response_body = 80

    [status, headers, [response_body]]
  end
end
