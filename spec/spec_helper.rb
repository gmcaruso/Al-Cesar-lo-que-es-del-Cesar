PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

require 'capybara/dsl'
require 'capybara/rspec'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara
  DataMapper.setup(:default, "abstract::")
  DataMapper::Logger.new($stdout, :all)
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app AlCesarLoQueEsDelCesar::App
#   app AlCesarLoQueEsDelCesar::App.tap { |a| }
#   app(AlCesarLoQueEsDelCesar::App) do
#     set :foo, :bar
#   end
#
def app(app = nil &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
