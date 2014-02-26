class Node
  attr_accessor :value, :next_node, :prev_node
  def initialize(value,next_node,prev_node)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

class DoublyLinkedList
  attr_accessor :linked_list

  def initialize()
    @linked_list = []
    200.times do
      if linked_list.last
        current_node = Node.new(rand(100), nil, linked_list.last.value)
        linked_list.last.next_node = current_node.value
      else
        current_node = Node.new(rand(100), nil, nil)
      end
      linked_list << current_node
    end
  end

  def remove_dups
    seen = []
    for i in linked_list
      if seen.include? i.value
        index = linked_list.index(i)
        if linked_list[(index - 1)]
          before = linked_list[(index - 1)].value
        end
        if linked_list[(index + 1)]
          after = linked_list[(index + 1)].value
        end
        if linked_list[(index + 1)]
          linked_list[(index + 1)].prev_node = before
        end
        if linked_list[(index - 1)]
          linked_list[(index - 1)].next_node = after
        end
        linked_list.delete_at(index)
      else
        seen << i.value
      end
    end
  end
end
