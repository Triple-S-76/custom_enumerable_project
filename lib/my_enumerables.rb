module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_all?
    count = 0
    while count < length
      return false if (yield self[count]) == false

      count += 1
    end
    true
  end

  def my_any?
    count = 0
    while count < length
      return true if (yield self[count]) == true

      count += 1
    end
    false
  end

  def my_count
    return length if block_given? == false

    count = 0
    amount = 0
    while count < length
      amount += 1 if yield self[count]
      count += 1
    end
    amount
  end

  def my_each
    count = 0
    while count < length
      yield self[count]
      count += 1
    end
    self
  end

  def my_each_with_index
    count = 0
    while count < length
      yield self[count], count
      count += 1
    end
    self
  end

  def my_inject(value)
    count = 0
    result = value
    while count < length
      result = yield result, self[count]
      count += 1
    end
    result
  end

  def my_map
    count = 0
    result = []
    while count < length
      element = yield self[count]
      result << element
      count += 1
    end
    p result
  end

  def my_none?
    count = 1
    while count < length
      result = yield self[count]
      return false if result == true

      count += 1
    end
    true
  end

  def my_select
    result = []
    count = 0
    while count < length
      result << self[count] if yield self[count]
      count += 1
    end
    p result
  end
end
