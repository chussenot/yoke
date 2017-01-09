require 'bundler'
Bundler.require
require 'rails/auth/rack'
require 'json/ext'

class App
  def call(_env)
    res = Rack::Response.new
    res.write 'Hello from Rack!'
    res.finish
  end
end

app = App.new
acl = Rails::Auth::ACL.from_yaml(
  File.read('config/acl.yml')
)

acl_auth = Rails::Auth::ACL::Middleware.new(app, acl: acl)

stack = Rails::Auth::ErrorPage::Middleware.new(
  acl_auth,
  page_body: File.read('public/403.html')
)

run stack
