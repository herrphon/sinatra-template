require 'rest-client'
require 'json'


url = 'http://localhost:4567/orders/1'
headers = { content_type: 'json', accept: 'json' }

response = RestClient.get(url, headers)
puts response.inspect


puts "---"


url = 'http://localhost:4567/solve'
payload = { data: { key: 'I am a value'}}.to_json
headers = { content_type: 'json', accept: 'json' }

response = RestClient.post url, payload , headers

puts response.inspect

