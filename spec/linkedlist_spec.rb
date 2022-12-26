require './lib/linkedlist'
require './lib/node'

describe LinkedList do
  before(:each) do
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @linkedlist = LinkedList.new
  end

  it 'can append' do
    @linkedlist.append(@node1)
    expect(@linkedlist.head).to eq(@node1)
    expect(@linkedlist.tail).to eq(@node1)
    @linkedlist.append(@node2)
    expect(@linkedlist.head).to eq(@node1)
    expect(@linkedlist.tail).to eq(@node2)
    @linkedlist.append(@node3)
    expect(@linkedlist.head).to eq(@node1)
    expect(@linkedlist.tail).to eq(@node3)
  end

  it 'can prepend' do
    @linkedlist.prepend(@node1)
    expect(@linkedlist.head).to eq(@node1)
    expect(@linkedlist.tail).to eq(@node1)
    @linkedlist.prepend(@node2)
    expect(@linkedlist.head).to eq(@node2)
    expect(@linkedlist.tail).to eq(@node1)
    @linkedlist.prepend(@node3)
    expect(@linkedlist.head).to eq(@node3)
    expect(@linkedlist.tail).to eq(@node1)
  end

  it 'has a size' do
    expect(@linkedlist).to be_a(LinkedList)
    expect(@linkedlist.size).to eq 0
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)
    expect(@linkedlist.size).to eq 3
  end

  it 'has a head' do
    expect(@linkedlist.head).to eq nil
    @linkedlist.append(@node1)
    expect(@linkedlist.head).to eq @node1
  end

  it 'has a tail' do
    expect(@linkedlist.tail).to eq nil
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.prepend(@node1)
    expect(@linkedlist.tail).to eq @node2
  end

  it 'can access at an index' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.at(0)).to eq @node1
    expect(@linkedlist.at(1)).to eq @node2
    expect(@linkedlist.at(2)).to eq @node3
  end

  it 'can access previous from index' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.previous_from(0)).to eq nil
    expect(@linkedlist.previous_from(1)).to eq @node1
    expect(@linkedlist.previous_from(2)).to eq @node2
  end

  it 'can remove the last element with pop' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.pop).to eq @node3
    expect(@linkedlist.pop).to eq @node2
    expect(@linkedlist.size).to eq 1
  end

  it 'can ask if it contains a value' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)
    # require 'pry'; binding.pry

    expect(@linkedlist.contains?(4)).to be false
    expect(@linkedlist.contains?(3)).to be true
  end

  it 'can find a value' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.find(1)).to eq 0
    expect(@linkedlist.find(2)).to eq 1
    expect(@linkedlist.find(3)).to eq 2
  end

  it 'can represent my linkedlist as a string' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.to_s).to eq '( 1 ) -> ( 2 ) -> ( 3 ) -> nil'
  end
end
