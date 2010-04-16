require "spec_helper"
require "linked_array"

describe "basic" do
  
  it "appends the arguments to the array" do
    a = LinkedArray.new([ "a", "b", "c" ])
    a.push("d", "e", "f")
    a.to_arry.should == [ "a", "b", "c", "d", "e", "f"]
    a.push()
    a.to_arry.should == ["a", "b", "c", "d", "e", "f"]
    a.push(5)
    a.to_arry.should == ["a", "b", "c", "d", "e", "f", 5]
  end
  
  it "removes and returns the last element of the array" do
    a = LinkedArray.new(["a", 1, nil, true])

    a.pop.should == true
    a.should == ["a", 1, nil]

    a.pop.should == nil
    a.should == ["a", 1]

    a.pop.should == 1
    a.should == ["a"]

    a.pop.should == "a"
    a.should == []
  end

  it "returns nil if there are no more elements" do
    LinkedArray.new([]).pop.should == nil
  end
  
  it "returns the number of elements" do
    LinkedArray.new([]).size.should == 0
    LinkedArray.new([1, 2, 3]).size.should == 3
  end
  
  it "returns true if the array has no elements" do
    LinkedArray.new([]).empty?.should == true
    LinkedArray.new([1]).empty?.should == false
    LinkedArray.new([1, 2]).empty?.should == false
  end
  
  it "returns the first element" do
    LinkedArray.new(["a", "b", "c"]).first.should == 'a'
    LinkedArray.new([nil]).first.should == nil
  end
  
  it "returns nil if self is empty" do
    LinkedArray.new([]).first.should == nil
  end
  
end