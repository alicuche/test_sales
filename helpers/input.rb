def print_example
  puts 'INPUT EXAMPLES:'
  puts '## Input 1'
  puts 'Quantity    Product       Price'
  puts '1           book          12.49'
  puts '1           music cd      14.99'
  puts '1           chocolate bar 0.85'
  puts '-------------------------'
  puts '## Input 2'
  puts 'Quantity    Product                       Price'
  puts '1           imported box of chocolates    10.00'
  puts '1           imported bottle of perfume    47.50'
  puts '-------------------------'
  puts '## Input 3'
  puts 'Quantity    Product                     Price'
  puts '1           imported bottle of perfume  27.99'
  puts '1           bottle of perfume           18.99'
  puts '1           packet of headache pills    9.75'
  puts '1           box of imported chocolates  11.25'  

  puts "\n\n***** Please enter input example(1, 2, 3):"
  type = gets
end

def init_data(type)
  case type.to_i
  when 1
    example1
  when 2
    example2
  when 3
    example3
  end  
end

def example1
  [
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'book', 
        price: 12.49, 
        imported: false, 
        free_tax: true
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'music cd', 
        price: 14.99, 
        imported: false, 
        free_tax: false
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'chocolate bar', 
        price: 0.85, 
        imported: false, 
        free_tax: true
      )
    )
  ]
end

def example2
  [
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'imported box of chocolates', 
        price: 10.00, 
        imported: true, 
        free_tax: true
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'imported bottle of perfume', 
        price: 47.50, 
        imported: true, 
        free_tax: false
      )
    )
  ]
end

def example3
  [
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'imported bottle of perfume', 
        price: 27.99, 
        imported: true, 
        free_tax: false
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'bottle of perfume', 
        price: 18.99, 
        imported: false, 
        free_tax: false
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'packet of headache pills', 
        price: 9.75, 
        imported: false, 
        free_tax: true
      )
    ),
    OrderDetail.new(
      quantity: 1,
      product: Product.new(
        name: 'box of imported chocolates', 
        price: 11.25, 
        imported: true, 
        free_tax: true
      )
    )
  ]
end