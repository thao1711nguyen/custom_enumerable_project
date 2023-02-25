module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    my_each do |item| 
      yield(item, i)
      i += 1
    end
    self
  end
  def my_select
    selected_items = []
    my_each do |item|
      condition = yield(item)
      if condition == true
        selected_items.push(item)
      end
    end
    selected_items
  end
  def my_all?(comparedValue=nil)
    result = true
    my_each do |item|
      if comparedValue
        result = false unless item == comparedValue
      else 
        condition = yield(item)
        result = false unless condition == true
      end
    end
    result
  end
  
  def my_none?(comparedValue=nil)
    result = true
    my_each do |item|
      if comparedValue
        result = false if item == comparedValue
      else 
        condition = yield(item)
        result = false if condition == true
      end
    end
    result
  end

  def my_count(comparedValue=nil)
    result = 0
    my_each do |item|
      if comparedValue
        result +=1 if item == comparedValue
      elsif block_given?
        condition = yield(item)
        result +=1 if condition == true
      else 
        result = self.size
      end
    end
    result
  end

  def my_map(&method)
    new_array = []
    my_each do |item|
      transform_item = method.call(item)
      new_array.push(transform_item)
    end
    new_array
  end

  def my_inject(initialValue=self[0],&block)
    accumulator=initialValue
    my_each do |item|
      accumulator = block.call(accumulator,item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end


end
