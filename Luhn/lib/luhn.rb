module Luhn
  def self.is_valid?(number)
    cc_evens =[]
    cc_reverse = number.to_s.reverse
    cc = cc_reverse.split('').map(&:to_i)

    cc.each_with_index do |digit, index|
      if index % 2 != 0
        digit = digit*2
        if digit >= 10
          digit = digit - 9
        end
        cc_evens << digit
      else cc_evens << digit
      end
    end
    # loop thru cc_evens array & take sum
    # sum % 10 == 0 ? valid, else not valid
    sum = 0
    cc_evens.each do |digit|
      sum = sum + digit
    end 
    return sum % 10 == 0
  end
end


