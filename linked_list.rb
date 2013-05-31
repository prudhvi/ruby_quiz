class Node
  attr_accessor :data
  attr_accessor :next

  def initialize(data)
    self.data = data
  end
end


class LinkedList

  attr_accessor :head, :tail

  def add(data)
    if head.nil? && tail.nil?
      self.head = Node.new(data)
      self.tail = head
    else
      tail.next = Node.new(data)
      self.tail = tail.next
    end
  end

  def display
    cur = head

    while cur
      puts cur.data
      cur = cur.next
    end
  end
end

if __FILE__ == $0
  l = LinkedList.new
  l.add(4)
  l.add(5)
  l.add(6)
  l.display
end