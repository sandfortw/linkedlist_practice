require './lib/node'


describe Node do

  before (:each) do
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
  end
  
  it 'has a value' do
    expect(@node1.value).to eq (1)
    expect(@node2.value).to eq (2)
    expect(@node3.value).to eq (3)
  end

  it 'has a next node that is nil by default' do
    expect(@node1.next).to eq (nil)
    expect(@node2.next).to eq (nil)
    expect(@node3.next).to eq (nil)
  end

  it 'can have a different value' do
    @node1.value = 'foo'
    @node2.value = 'bar'
    @node3.value = 'blarg'

    expect(@node1.value).to eq ('foo')
    expect(@node2.value).to eq ('bar')
    expect(@node3.value).to eq ('blarg')
  end

  it 'can have a different next node' do
    @node1.next = @node2
    @node2.next = @node3

    expect(@node1.next).to eq @node2
    expect(@node2.next).to eq @node3
  end
end