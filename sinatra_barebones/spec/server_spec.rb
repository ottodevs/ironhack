require './server.rb'

require 'rack/test'

describe 'Sinatra Blog' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should load the home (root) page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should not load a page that doesn´t exist' do
    get '/not_exist'
    expect(last_response).to_not be_ok
  end
end
