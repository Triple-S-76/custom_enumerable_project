module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    while count < length
      p yield(self[count], count)
      p 'break'
      count += 1
    end
    self
  end

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
    count_result = 0

    while count < length
      result = yield self[count]
      count_result += 1 if result == true
      count += 1
    end
    count_result
  end

  def my_inject(arg)
    count = 0
    result = arg
    while count < length
      result = yield(result, self[count])
      count += 1
    end
    result
  end

  def my_map
    count = 0
    final_result = []
    while count < length
      result = yield self[count]
      final_result << result
      count += 1
    end
    final_result
  end

  def my_none?
    count = 0
    while count < length
      result = yield self[count]
      return false if result == true

      count += 1
    end
    true
  end

  def my_select
    count = 0
    final_result = []
    while count < length
      result = yield self[count]
      final_result << self[count] if result == true
      count += 1
    end
    final_result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    count = 0
    while count < length
      yield self[count]
      count += 1
    end
    self
  end
end
