require 'logger'

class NumberString

  def initialize
    @log = Logger.new(STDOUT);
    @log.level = Logger::INFO
  end
 
  def to_string(number:)
    tag = "#{self.class}\##{__method__}"

    methods = [
      proc {|num| single_digit(number: num) },
      proc {|num| tens(number: num) },
      proc {|num| hundreds(number: num) }
    ]

    num_array = number.to_s.chars
    @log.debug(tag) { "number: #{number}, array: #{num_array}" }

    if number == 0
      "zero"
    else
      final_str = []
      num_array.reverse.each_with_index do |val, index|
        str = methods[index].call(val.to_i)
        final_str.push( str == "" ? "" : " #{str}" )
      end
      final_str.reverse.join.strip
    end
  end

# Take the length of the array
# Take the corresponding character of the string for the length of the array - should equal units
# Work backwards through loop - each minus would be up one unit
#

private

  def zero(number:)
    ""
  end

  def single_digit(number:)
    number_hash = {
      0 => "",
      1 => "one",
      2 => "two",     
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine"
    }
    number_hash[number]
  end

  def tens(number:)
    number_hash = {
      0 => "",
      1 => "ten",
      2 => "twenty",     
      3 => "thirty",
      4 => "fourty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }
    number_hash[number]
  end

  def hundreds(number:)
    "one hundred"
  end

end
