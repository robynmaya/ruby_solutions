=begin
Runtime Complexity
push(): Constant, O(1).

pop(): Linear, O(n).

Memory Complexity
Linear, O(n).
=end

class Stack_using_queue_1
  attr_accessor :queue1, :queue2
  def initialize()
    @queue1 = []
    @queue2 = []
  end

  def push(data)
    @queue1.push(data)
  end

  def isEmpty()
    return ((@queue1.length + @queue2.length) == 0)
  end


  def swap_queues()
    temp = @queue1
    @queue1 = @queue2
    @queue2 = temp
  end

  def pop()
    if self.isEmpty
      throw "stack is empty"
    end

    while (@queue1.length > 1)
      @queue2.push(@queue1.shift())
    end

    value = @queue1.shift()

    self.swap_queues

    return value
  end
end

# or...

=begin
Runtime Complexity
push(): Linear, O(n).

pop(): Constant, O(1).

Memory Complexity
Linear, O(n).
=end

class Stack_using_queue_2
  attr_accessor :queue1, :queue2
  def initialize()
    @queue1 = []
    @queue2 = []
  end

  def swap_queues()
    temp = @queue1
    @queue1 = @queue2
    @queue2 = temp
  end

  def push(data)
    if (@queue1.length == 0)
      @queue1.push(data)
    else
      @queue2.push(data)
      while (@queue1.length != 0)
        @queue2.push(@queue1.shift())
      end
      self.swap_queues
    end
  end

  def isEmpty()
    return @queue1.length + @queue2.length == 0
  end

  def pop()
    if self.isEmpty
      throw "stack is empty"
    end
    return @queue1.shift()
  end
end
