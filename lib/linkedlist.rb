include Enumerable

class LinkedList
  attr_accessor :name
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next = @head
      @head = value
    end
  end

  def append(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      @tail.next = value
      @tail = value
    end
  end

  def size
    count = 0
    return 0 if @head.nil?

    entry = @head
    until entry.nil?
      count += 1
      entry = entry.next
    end
    count
  end

  def at(index)
    entry = @head
    index.times do
      entry = entry.next
    end
    entry
  end

  def previous_from(index)
    return nil if index == 0

    entry = @head
    (index - 1).times do |_i|
      entry = entry.next
    end
    entry
  end

  def pop
    deleted = @tail
    @tail = previous_from(size - 1)
    @tail.next = nil
    deleted
  end

  def contains?(value)
    entry = @head
    until entry.nil?
      return true if entry.value == value

      entry = entry.next
    end
    false
  end

  def find(value)
    if contains?(value)
      entry = @head
      count = 0
      until entry.value == value || entry.nil?
        count += 1
        entry = entry.next
      end
      return count
    end
    nil
  end

  def to_s
    entry = @head
    accumulator = []
    until entry.nil?
      accumulator << "( #{entry.value} ) ->"
      entry = entry.next
    end
    accumulator << 'nil'
    accumulator.join(' ')
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index == 0
      prepend(new_node)
    elsif index == (size - 1)
      append(new_node)
    else
      previous = at((index - 1))
      after = at((index))
      previous.next = new_node
      new_node.next = after
    end
  end
end
