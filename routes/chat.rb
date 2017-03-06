class MyApp < Sinatra::Base

  # set :server, :thin
  connections = []

  get '/chat/' do
    # register a client's interest in server events
    stream(:keep_open) do |out|
      connections << out
      # purge dead connections
      connections.reject!(&:closed?)
    end
  end

  get '/chat/:message' do
    connections.each do |out|
      # notify client that a new message has arrived
      out << params['message'] << "\n"

      # indicate client to connect again
      out.close
    end

    # acknowledge
    "message received"
  end

end
