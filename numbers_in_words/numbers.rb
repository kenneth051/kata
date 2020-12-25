class Numbers
  def initialize(number)
    @number = number
    @in_words = []
  end

  def numbers_to_words
    @in_words.join(" ")
  end

  def convert
    thousands
    hundreds
    tens
    ones
  end

  def ones
    number_as_string = @number.to_s
    if number_as_string.length == 1
      @in_words << numbers_one_to_nineteen[@number.to_s]
    end
  end

  def teens(number_as_string)
    if number_as_string.length == 2 && @number < 20
      @in_words << numbers_one_to_nineteen[@number.to_s]
    end
  end

  def tens_greater_than_19(number_as_string)
    if number_as_string.length == 2 && @number > 19
      current_number = number_as_string.slice!(0)
      @in_words << twenty_to_ninety[current_number]
      @number = number_as_string.to_i
    end
  end

  def tens
    number_as_string = @number.to_s
    tens_greater_than_19(number_as_string)
    teens(number_as_string)
  end

  def hundreds
    get_place_value(3, "hundred")
  end

  def thousands
    get_place_value(4, "thousand")
  end

  def get_place_value(size, place_value)
    number_as_string = @number.to_s
    if number_as_string.length == size
      current_number = number_as_string.slice!(0)
      @in_words << "#{numbers_one_to_nineteen[current_number]} #{place_value}"
      @number = number_as_string.to_i
    end
  end

  def numbers_one_to_nineteen
    { "1" => "one", "2" => "two", "3" => "three", "4" => "four",
      "5" => "five", "6" => "six", "7" => "seven", "8" => "eight",
      "9" => "nine", "10" => "ten", "11" => "eleven", "12" => "twelve",
      "13" => "thirteen", "14" => "fourteen", "15" => "fifteen", "16" => "sixteen",
      "17" => "seventeen", "18" => "eighteen", "19" => "nineteen" }
  end

  def twenty_to_ninety
    { "2" => "twenty", "3" => "thirty",
      "4" => "fourty", "5" => "fifty",
      "6" => "sixty", "7" => "seventy",
      "8" => "eighty", "9" => "ninety" }
  end
end
