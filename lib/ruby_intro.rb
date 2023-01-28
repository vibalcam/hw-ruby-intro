# frozen_string_literal: true

# Part 1

def sum(arr)
  # YOUR CODE HERE
  # keep accumulated sum
  arr.inject(0) {|memo,n| memo + n}
end

def max_2_sum(arr)
  # YOUR CODE HERE
  max_2 = arr.inject([]) do |memo, n|
    # add value to array
    memo << n
    # get minimum value and index in array if array has at least 3 values and remove it
    if memo.length > 2
      # min_value, min_idx = memo.each_with_index.inject do |memo_pair, pair| 
      #   memo_pair[0] < pair[0] ? memo_pair : pair
      # end
      # memo.delete_at(min_idx)

      # can also be done by sorting and removing lowest
      memo.sort!.shift
    end
    # return resulting array
    memo
  end
  sum(max_2)
end

def sum_to_n?(arr, number)
  # YOUR CODE HERE
  # check that array has at least 2 values and that it can reach the desired number
  return false if arr.length < 2 or max_2_sum(arr) < number

  # check sum of pairs of values
  # sort the array so we can exit promptly if sum surpasses the desired value
  arr.sort!
  arr.each_with_index do |n,idx|
    arr[idx+1..-1].each do |k|
      sum_2 = n + k
      return true if sum_2 == number
      break if sum_2 > number
    end
  end
  false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  "Hello, " + name
end

def starts_with_consonant?(string)
  # YOUR CODE HERE
  return false if string.empty?

  vocals = ['a', 'e', 'i', 'o', 'u']
  first_char = string[0].downcase
  first_char =~ /[a-z]/ && !vocals.include?(first_char)
end

def binary_multiple_of_4?(string)
  # YOUR CODE HERE
  # /[^01+$]/ checks if all values are 0 or 1
  # ^ means start of string
  # [01] means either 0 or 1
  # + means 1 or more times
  # $ means end of the string
  # to_int converts to integer in the given base (binary, thus based 2)
  string =~ /^[01]+$/ ? string.to_i(2) % 4 == 0 : false
end

# Part 3

# Object representing a book
class BookInStock
  # YOUR CODE HERE
  attr_reader :isbn, :price

  def initialize(isbn, price)
    self.isbn=isbn
    self.price=price
  end

  def isbn=(value)
    raise ArgumentError if value.empty?
    @isbn = value
  end

  def price=(value)
    raise ArgumentError if  value <= 0
    @price = value * 1.0  # to ensure it is a float
  end

  def price_as_string
    sprintf("$%.2f", price)
  end
end
