require 'json'

# http://sequel.jeremyevans.net/rdoc/files/doc/validations_rdoc.html

class Order < Sequel::Model
  # http://sequel.jeremyevans.net/rdoc-plugins/classes/Sequel/Plugins/Timestamps.html
  plugin :timestamps, update_on_create: true

  def to_json(parmas)
    data = { id: id, name: name }
    data[:description] = description if description
    data.to_json
  end
end

