class MyApp < Sinatra::Base

  # Create:
  #  - POST /orders          <---> orders.push(data)
  #
  # Read:
  #  - GET  /orders          <---> orders
  #  - GET  /orders/1        <---> orders[1]
  #
  # Update:
  #  - PUT  /orders/1        <---> orders[1] = data
  #
  # Delete:
  #  - DELETE /orders/1      <---> orders[1].destroy
  #
  # Operations on Childen:
  #  - GET  /orders/1/lines  <---> orders[1].lines
  #  - POST /orders/1/lines  <---> orders[1].lines.push(data)


  # create order
  post '/orders' do
    # Request.body.read is destructive, make sure you don't use a puts here.
    data = JSON.parse(request.body.read)

    # Normally we would let the model validations handle this but we don't
    # have validations yet so we have to check now and after we save.
    if data.nil? || data['subject'].nil? || data['content'].nil?
      halt 400
    end

    order = Order.create( name: data['name'],
                          description: data['description'] )

    halt 500 unless order.save

    # PUT requests must return a Location header for the new resource
    [201, {'Location' => "/orders/#{order.id}"}, order.to_json]
  end


  # list all orders
  get '/orders' do
    json Order.all
  end


  # show order
  get '/orders/:id' do
    order = Order.find(params[:id])

    test = order.inspect

    json order
  end


  # update
  post '/orders/:id' do
    # Request.body.read is destructive, make sure you don't use a puts here.
    data = JSON.parse(request.body.read)
    halt 400 if data.nil?

    order = Order.get(params[:id])
    halt 404 if order.nil?

    %w(subject content).each do |key|
      if !data[key].nil? && data[key] != order[key]
        order[key] = data[key]
        order['updated_at'] = Time.now.utc
      end
    end

    halt 500 unless order.save
    json order
  end


  # delete order
  delete '/orders/:id' do
    Order.find(params[:id]).destroy
    redirect '/orders'
  end

end
