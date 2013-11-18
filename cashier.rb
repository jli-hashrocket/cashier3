require 'pry'
require_relative "class_cashier.rb"

puts "Welcome to the Coffee Emporium"

puts "1) Add item - $5.00 - Light Bag"
puts "2) Add item - $7.50 - Medium Bag"
puts "3) Add item - $9.75 - Bold Bag"
puts "4) Complete Sale"

cashier = Cashier.new

while true
  cashier.ask
end



=begin
transaction = Cashier.new  
puts "What is the amount due?"
due = gets.chomp
unless transaction.response_check(due)
  exit
end
due = due.to_f
puts "What is the amount tendered?"
tendered = gets.chomp
unless transaction.response_check(tendered)
  exit
end
tendered = tendered.to_f
transaction.calculate(due, tendered)
transaction.output(due, tendered)
=end