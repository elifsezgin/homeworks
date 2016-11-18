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

class Map

  def initialize
    @map = []
  end

  def assign(key, value)

    index = @map.index {|k, _| k == key}
    index ? @map[index][1] = value : @map << [key, value]

  end

  def lookup(key)
    @map.any? {|k, _| k == key }
  end

  def remove(key)
    @map.reject! {|pair| pair[0] == key}
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
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

  p map = Map.new
  p map.assign("elif", "sezgin")
  p map.show
  p map.assign("app", "academy")
  p map.show
  p map.assign("san", "francisco")
  p map.show
  p map.lookup("elif")
  p map.show
  p map.lookup("sezgin")
  p map.show
  p map.assign("app", "store")
  p map.show
  p map.remove("app")
  p map.show
  p map.assign("san", "leandro")
  p map.show
  p map.remove("san")
end
