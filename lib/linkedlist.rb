include Enumerable

class LinkedList
  attr_accessor :name
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def each
    return nil if @head.nil?
    entry = @head
    until entry.nil?
      yield entry
      entry = entry.next
    end
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
    index.times do |i|
      entry = entry.next
    end
    entry
  end

  def previous_from(index)
    return nil if index == 0
    entry = @head
    (index - 1).times do |i|
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
     if entry.value == value
      return true
     end
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
    accumulator << "nil"
    accumulator.join(" ")
  end



end