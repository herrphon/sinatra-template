require 'sequel'

DB = Sequel.sqlite

class Item < Sequel::Model
end



item = Item.new
item.name = "asdf"
item.price = 15.5
item.save

item = Item.new(name: "jkloe", price: 122).save



items = DB[:items]
puts "Item count: #{items.count}"

