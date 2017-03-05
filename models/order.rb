
class Order < Sequel::Model
  # http://sequel.jeremyevans.net/rdoc-plugins/classes/Sequel/Plugins/Timestamps.html
  plugin :timestamps, update_on_create: true
end

