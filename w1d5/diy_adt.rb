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


#test codes
if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  stack.add(1)
  stack.show
  stack.add(2)
  stack.show
  stack.add(4)
  stack.show
  stack.remove
  stack.show
end
