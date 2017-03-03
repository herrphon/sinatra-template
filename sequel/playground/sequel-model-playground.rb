require 'sequel'

DB = Sequel.sqlite

class Item < Sequel::Model
end



item = Item.new
item.name = "asdf"
item.price = 15.5
item.save



items = DB[:items]
puts "Item count: #{items.count}"

