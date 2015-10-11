require_relative '../lib/float'

class NumberHelper

  def self.format(number)
    number.to_f.abs.ceil2(2) 
  end

end