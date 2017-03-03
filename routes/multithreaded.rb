class MyApp < Sinatra::Base

  get "/sleep" do
    sleep 10
    "sleeping ended"
  end

  get "/multithread" do
    t1 = Thread.new{
      puts "sleeping for 10 sec"
      sleep 10
      # Actually make a call to Third party API using HTTP NET or whatever.
    }
    t1.join
    "multi thread"
  end

  get "/dummy" do
    time1 = Time.new
    "dummy #{time1.inspect}"
  end

  get "/bla" do
    params.inspect
  end

end
