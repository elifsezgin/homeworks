class Stack

  def initialize
    @ivar = []
    # create ivar to store stack here!
  end

  def add(el)
    @ivar << el
    # adds an element to the stack
  end

  def remove
    @ivar.pop
    # removes one element from the stack
  end

  def show
    @ivar.dup
    # return a copy of the stack
  end

end

class Queue

  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.unshift(el)
  end

  def dequeue
    @ivar.pop
  end

  def show
    @ivar.dup
  end

end


#test codes
if __FILE__ == $PROGRAM_NAME
  p stack = Stack.new
  p stack.add(1)
  p stack.show
  p stack.add(2)
  p stack.show
  p stack.add(4)
  p stack.show
  p stack.remove
  p stack.show

  p queue = Queue.new
  p queue.enqueue(1)
  p queue.show
  p queue.enqueue(4)
  p queue.show
  p queue.dequeue
  p queue.show
end
