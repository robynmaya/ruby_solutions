=begin
A circular queue is a collection of objects stored in a buffer that is treated
as though it is connected end-to-end in a circle. When an object is added to
this circular queue, it is added to the position that immediately follows
the most recently added object, while removing an object always removes the object
that has been in the queue the longest.

Write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

enqueue to add an object to the queue
dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
=end


class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size  # to return back to zero when the array is full
  end
end
