
#User Story2
#As a seller
#I want to quickly enter purchases without manual entry
#so that I can calculate the order total.
 
#Acceptance Criteria 1
#Enter items without manual price entry
#Specify the quantity of items
#Return a subtotal
#Keeps asking until sale is complete
 
#User Story 2
#As a seller
#I want to see the purchase total
#so that I know how much money is owed
 
#Acceptance Critera 2
#Display the items ordered
#Display the order total
 
#User Story 3
#As a seller
#I want to input the amount tendered
#so that I know the correct change to return.
 
#Acceptance Criteria 3
#Prompt to input the amount tendered
#Calculate the amount of change owed

class Cashier
  def initialize
    @coffee_bags = {"1" => {style: "light", price: 5.00}, "2" => {style: "medium", price: 7.50}, "3" => {style: "bold", price:9.75}}
    @qty = 0
    @sub_arr = []
    @sub_total = 0.00
    @total_purchased = {}
    @all_items = []
    @tender = 0.00
  end

  def ask
    puts "Make a selection:"
    @selection = gets.chomp
    if !@selection.match(/\d{2,}|\D/)   
      if @selection == "4"
        tender
        receipt
        abort
      else
        puts "How many bags?"
        @qty = gets.chomp
        if !@selection.match(/\d{2,}|\D/)   
          @qty = @qty.to_i
          subtotal
          store
        else
          puts "That's an invalid option"
        end
      end
    else
      puts "That is an invalid option."
    end
  end

  def store
    coffee_purchased = @coffee_bags[@selection][:style]
    coffee_qty = @qty
    coffee_subtotal = @sub_total
    @total_purchased[:item] = {style:coffee_purchased, subtotal:coffee_subtotal, qty:coffee_qty}
    @all_items << @total_purchased[:item]
  end

  def subtotal
    if @coffee_bags.has_key?(@selection)
      @sub_total = @coffee_bags[@selection][:price].to_f * @qty
      @sub_arr <<  @sub_total
      @sub_total_all = @sub_arr.inject(:+)
      puts "Subtotal: $#{@sub_total_all}"
    end
  end

  def tender
    puts "What is the amount tendered?"
    @tender = gets.chomp
    @change = @tender.to_f - @sub_total_all
  end

  def receipt
    date = Time.now.strftime("%m/%d/%y %I:%M:%S") 
    puts "===Sale Complete==="
    @all_items.each do |item|
      puts "$#{item[:subtotal].round(2)} - #{item[:qty]} #{item[:style]}"
    end
    puts "=====Thank You!====="
    puts "\nThe total change due is:#{@change}"
    puts "#{date}"
    puts "===================="
  end
end