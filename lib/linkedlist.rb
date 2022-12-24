class LinkedList
  attr_accessor :name

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

end