require '../server.rb'
require 'rspec'
require 'rack/test'

describe 'My Web App' do
  include Rack::Test::Methods

  def app
    Sinatra::Aplication

      it 'should load the home (root) page' do
        get '/'
        expect(last_response).to be_ok
    end

      it 'should load the home (root) page' do
        get '/'
        expect(last_response).to be_ok
    end

      it 'should load the home (root) page' do
        get '/'
        expect(last_response).to be_ok
    end

      it 'should load the home (root) page' do
        get '/'
        expect(last_response).to be_ok
    end
  end
end
