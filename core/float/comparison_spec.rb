require File.dirname(__FILE__) + '/../../spec_helper'

describe "Float#<=>" do
  before(:all) do
    @inf = 1/0.0
    @nan = 0/0.0
  end

  it "returns -1, 0, 1 when self is less than, equal, or greater than other" do
    (1.5 <=> 5).should == -1
    (2.45 <=> 2.45).should == 0
    ((bignum_value*1.1) <=> bignum_value).should == 1
  end

  # The 4 tests below are taken from matz's revision 23730 for Ruby trunk
  #
  it "returns 1 when self is Infinity and other is a Bignum" do
    (@inf <=> Float::MAX.to_i*2).should == 1
  end  

  it "returns 1 when self is negative and other is Infinty" do
    (-Float::MAX.to_i*2 <=> @inf).should == 1
  end  

  it "returns -1 when self is -Infinity and other is negative" do
    (-@inf <=> -Float::MAX.to_i*2).should == -1
  end

  it "returns -1 when self is negative and other is -Infinity" do
    (-@inf <=> -Float::MAX.to_i*2).should == -1
  end
end
