class MyApp < Sinatra::Base

  get '/doc' do
    redirect '/doc/'
  end

  # Displays a settings page for the current user
  #
  # @see ExampleApp#asdf
  get '/doc/' do
    index = File.join(__dir__, "..", "doc", "index.html")
    File.read(index)
    send_file(index)
  end

  get '/doc/*' do
    index = File.join(__dir__, "..", request.path)
    File.read(index)
    send_file(index)
  end

end
