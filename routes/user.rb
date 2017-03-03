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

end
