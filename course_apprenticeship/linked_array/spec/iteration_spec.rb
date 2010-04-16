require "spec_helper"
require "linked_array"


describe LinkedArray, "Iterations" do
  it "yields each element to the block" do
    a = []
    x = LinkedArray.new([1, 2, 3])
    x.each { |item| a << item }.should equal(x)
    a.should == [1, 2, 3]
  end
  
  it "returns a copy of array with each element replaced by the value returned by block" do
    a = LinkedArray.new(['a', 'b', 'c', 'd'])
    b = a.collect { |i| i + '!' }
    b.to_arry.should == ["a!", "b!", "c!", "d!"]
    b.object_id.should_not == a.object_id
  end
  

end