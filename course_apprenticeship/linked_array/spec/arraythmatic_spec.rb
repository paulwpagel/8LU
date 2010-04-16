require "spec_helper"
require "linked_array"

describe LinkedArray, "Arraythmatic" do
  
  it "removes all elements" do
    a = LinkedArray.new([1, 2, 3, 4])
    a.clear.should == a
    a.to_arry.should == []
  end

  it "returns a copy of array with all nil elements removed" do
    a = LinkedArray.new([1, 2, 4])
    a.compact.to_arry.should == [1, 2, 4]
    a = LinkedArray.new([1, nil, 2, 4])
    a.compact.to_arry.should == [1, 2, 4]
    a = LinkedArray.new([1, 2, 4, nil])
    a.compact.to_arry.should == [1, 2, 4]
    a = LinkedArray.new([nil, 1, 2, 4])
    a.compact.to_arry.should == [1, 2, 4]
  end

  it "does not return self" do
    a = LinkedArray.new([1, 2, 3])
    a.compact.should_not equal(a)
  end
  
  it "appends the elements in the other array" do
    ary = LinkedArray.new([1, 2, 3])
    ary.concat(LinkedArray.new([9, 10, 11]))
    ary.to_arry.should == [1, 2, 3, 9, 10, 11]
    ary.concat(LinkedArray.new([]))
    ary.should == [1, 2, 3, 9, 10, 11]
  end

  it "does not loop endlessly when argument is self" do
    ary = LinkedArray.new(["x", "y"])
    ary.concat(ary).to_arry.should == ["x", "y", "x", "y"]
  end
  
  it "removes the element at the specified index" do
    a = LinkedArray.new([1, 2, 3, 4])
    a.delete_at(2)
    a.to_arry.should == [1, 2, 4]
    a.delete_at(-1)
    a.to_arry.should == [1, 2]
  end

  it "returns the removed element at the specified index" do
    a = LinkedArray.new([1, 2, 3, 4])
    a.delete_at(2).should == 3
    a.delete_at(-1).should == 4
  end

  it "returns nil and makes no modification if the index is out of range" do
    a = LinkedArray.new([1, 2])
    a.delete_at(3).should == nil
    a.to_arry.should == [1, 2]
    a.delete_at(-3).should == nil
    a.to_arry.should == [1, 2]
  end

  it "inserts objects before the element at index for non-negative index" do
    ary =  LinkedArray.new([])
    ary.insert(0, 3).to_arry.should == [3]
    ary.insert(0, 1, 2).to_arry.should == [1, 2, 3]
    ary.insert(0).to_arry.should == [1, 2, 3]

    # Let's just assume insert() always modifies the array from now on.
    ary.insert(1, 'a').to_arry.should == [1, 'a', 2, 3]
    ary.insert(0, 'b').to_arry.should == ['b', 1, 'a', 2, 3]
    ary.insert(5, 'c').to_arry.should == ['b', 1, 'a', 2, 3, 'c']
    ary.insert(7, 'd').to_arry.should == ['b', 1, 'a', 2, 3, 'c', nil, 'd']
    ary.insert(10, 5, 4).to_arry.should == ['b', 1, 'a', 2, 3, 'c', nil, 'd', nil, nil, 5, 4]
  end

  it "appends objects to the end of the array for index == -1" do
    LinkedArray.new([1, 3, 3]).insert(-1, 2, 'x', 0.5).to_arry.should == [1, 3, 3, 2, 'x', 0.5]
  end

  it "inserts objects after the element at index with negative index" do
    ary = LinkedArray.new([])
    ary.insert(-1, 3).to_arry.should == [3]
    ary.insert(-2, 2).to_arry.should == [2, 3]
    ary.insert(-3, 1).to_arry.should == [1, 2, 3]
    ary.insert(-2, -3).to_arry.should == [1, 2, -3, 3]
    ary.insert(-1, []).to_arry.should == [1, 2, -3, 3, []]
    ary.insert(-2, 'x', 'y').to_arry.should == [1, 2, -3, 3, 'x', 'y', []]
  end
  
  it "reverses the elements in place" do
    a = LinkedArray.new([6, 3, 4, 2, 1])
    a.reverse!
    a.to_arry.should == [1, 2, 4, 3, 6]
    LinkedArray([]).reverse!.to_arry.should == []
  end
  
  
end