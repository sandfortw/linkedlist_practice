require './lib/linkedlist'
require './lib/node'


describe LinkedList do 

  before(:each) do 
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @linkedlist = LinkedList.new
  end

  xit 'can append' do
    @linkedlist.append(@node1)

  end

  xit 'can prepend' do
    @linkedlist.prepend(@node1)

  end

  xit 'has a size' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.prepend(@node1)

    expect(@linkedlist.size).to eq 3
  end

  xit 'has a head' do
    expect(@linkedlist.head).to eq nil
    @linkedlist.append(@node1)
    expect(@linkedlist.head).to eq @node1
  end

  xit 'has a tail' do 
    expect(@linkedlist.tail). to eq nil
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.prepend(@node1)
    expect(@linkedlist.tail).to eq @node2
  end

  xit 'can access at an index' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.at(1)).to eq @node1
    expect(@linkedlist.at(2)).to eq @node2
    expect(@linkedlist.at(3)).to eq @node3
  end

  xit ' can remove the last element with pop' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.pop).to eq @node3
    expect(@linkedlist.pop).to eq @node2
    expect(@linkedlist.size).to eq 1 
  end

  xit 'can ask if it contains a value' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.contains?(4)).to be false
    expect(@linkedlist.contains(@node3)).to be true
  end

  xit 'can find a value' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.find(@node2)).to eq 1
  end

  xit 'can represent my linkedlist as a string' do
    @linkedlist.append(@node1)
    @linkedlist.append(@node2)
    @linkedlist.append(@node3)

    expect(@linkedlist.to_s).to eq '( #{@node1} ) -> ( #{@node2} ) -> ( #{@node3} ) -> nil'
  end
end