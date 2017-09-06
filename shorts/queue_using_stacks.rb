=begin
A stack is a data structure in which objects are inserted and removed according
to the LIFO(Last In First Out) principle. An item is added at the top of the stack
and removed from the top as well. push means to insert an item at the top of the stack
and pop means to remove an item from the top of the stack.

A queue is a data structure in which objects are inserted and removed according
to the FIFO(First In First Out) principle. An item is added at the back of the queue
and removed from the front. enqueue means to insert an item at the back of the queue
and dequeue means to remove an item from the front of the queue.

Solution #1

Runtime Complexity
enqueue(): Constant, O(1).

dequeue(): Linear, O(n).

Memory Complexity
Linear, O(n).
=end

class Queue_using_stack_1
  def initialize()
    @stack1 = []
    @stack2 = []
  end

  def enqueue(data)
    @stack1.push(data)
  end

  def empty()
    return (@stack1.length == 0 && @stack2.length == 0)
  end

  def dequeue()
    if self.empty
      throw "stack is empty"
    end

    if (@stack2.length == 0)
      while (@stack1.length != 0)
        @stack2.push(@stack1.pop())
      end
    end

    return @stack2.pop()
  end
end

# or ...
=begin
Runtime Complexity
enqueue(): Linear, O(n).

dequeue(): Constant, O(1).

Memory Complexity
Linear, O(n).
=end

 class Queue_using_stack_2
  def initialize()
    @stack1 = []
    @stack2 = []
  end

  def enqueue(data)

    while (@stack1.length != 0)
      @stack2.push(@stack1.pop())
    end
    @stack1.push(data)

    while (@stack2.length != 0)
      @stack1.push(@stack2.pop())
    end
  end

  def empty()
    return (@stack1.length == 0 && @stack2.length == 0)
  end

  def dequeue()
    if self.empty
      throw "stack is empty"
    end
    return @stack1.pop()
  end
end
