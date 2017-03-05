class MyApp < Sinatra::Base
  before do
    @flash = session.delete(:flash)
  end

  # Displays a settings page for the current user
  #
  # @see ExampleApp#settings
  get '/' do
    erb :index
  end

  # Displays a settings page for the current user
  #
  # @see ExampleApp#settings
  get '/test-flash' do
    session[:flash] = 'This is a flash'
    redirect to('/')
    erb :index
  end

  # Test inspired by
  # https://spin.atomicobject.com/2013/11/12/production-logging-sinatra/
  get '/test-exceptions' do
    fail_here = File.read('asdf')
  end


  post '/solve/?' do
    require 'json'
    jdata = params[:data]
    JSON.parse(jdata)
  end
end
