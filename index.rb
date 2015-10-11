require_relative 'models/product'
require_relative 'models/order_detail'
require_relative 'models/order'
require_relative 'helpers/input'

loop do
  type = print_example
  if [1, 2, 3].include?(type.to_i)
    order_details = init_data(type)
    order = Order.new(order_details: order_details)

    puts "\n\n***** OUPUT:"
    puts order.to_csv

    break    
  end
end