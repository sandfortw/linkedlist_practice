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

  # def size
  #   count = 0
  #   return 0 if @head.nil?
  #   entry = @head
  #   until entry.nil?
  #     count += 1
  #     entry = entry.next
  #   end
  #   count
  # end

  # def at(index)

  # end

  # def pop

  # end

  # def contains?(value)

  # end

  # def find(value)

  # end

  # def to_s

  # end



end