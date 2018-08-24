class Queue
attr_reader :line
  def initialize
    @line = []
  end

  def  enqueue(el)
    @line.unshift(el)
  end

  def dequeue
    @line.pop
  end

  def peek
    @line.last
  end
end
