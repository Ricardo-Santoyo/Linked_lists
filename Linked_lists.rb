class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_accessor :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        node = Node.new(value)
        if @head == nil
            @head = node
        else
            @tail.next_node = node
        end
        @tail = node
        @size += 1
    end

    def prepend(value)
        node = Node.new(value)
        if @head == nil
            @head = node
        else
            node.next_node = @head
            @head = node
        end
        @size += 1
    end

    def size
        puts "size: #{@size}"
    end

    def head
        puts "head: #{@head.value}"
    end

    def tail
        puts "tail: #{@tail.value}"
    end

    def at(index)
        if index >= @size
            "invaild index"
        else
            node = @head
            index.times do
                node = node.next_node
            end
            node.value
        end
    end

    def pop
        if @head == nil
            puts "List is empty."
        elsif @head == @tail
            @head = nil
            @tail = nil
            @size = 0
        else
            node = @head
            node = node.next_node while node.next_node != @tail
            node.next_node = nil
            @tail = node
            @size -= 1
        end
    end

    def contains?(value)
        node = @head
        while node != nil
            if node != nil && node.value == value
                return true
            end
            node = node.next_node
        end
        return false if node == nil
    end

    def find(value)
        index = 0
        node = @head
        while node != nil
            if node.value == value
                return "index: #{index}"
            end
            index += 1
            node = node.next_node
        end
        return "nil" if node == nil
    end

    def to_s
        node = @head
        string = ""
        while node != nil
            string += "( #{node.value} ) -> "
            node = node.next_node
        end
        string += "nil"
        puts string
    end
end

list = LinkedList.new
list.append(2)
list.append(3)
list.prepend(1)
list.prepend(0)
list.append(4)
list.head
list.tail
list.size
puts list.at(1)
puts list.contains?(4)
puts list.find(4)
list.to_s
list.pop
list.head
list.tail
list.size
puts list.at(1)
puts list.contains?(4)
puts list.find(4)
list.to_s