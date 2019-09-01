require "./lib/enumerable.rb"

describe Enumerable do
  describe "#my_select" do
    it "selects those objects that match block passed" do
      expect([1,2,3,4,5].my_select{|n| n % 2 != 0}).to eql([1,3,5])
      expect([1,2,3].my_select{|n| n.is_a? String}).to eql([])
    end
  end

  describe "#my_all?" do
    it "handles true case" do
      expect(["one", "two", "three"].my_all?{|str| str.is_a? String}).to eql(true)
    end
    it "handles false case" do
      expect([1,2,3].my_all?{|n| n.is_a? String}).to       eql(false)
      expect([1,2,"three"].my_all?{|n| n.is_a? String}).to eql(false)
    end
  end

  describe "#my_none?" do
    it "handles true case, none satisfy block passed" do
      expect([1,2,3].my_none?{|n| n.is_a? String}).to eql(true)
    end
    it "handles false case" do
      expect([1,2,"three"].my_none?{|n| n.is_a? String}).to eql(false)
    end
  end

  describe "#my_count" do
    it "correctly counts size of self" do
      expect([1,2,3].my_count).to eql(3)
      expect([].my_count).to      eql(0)
    end
  end

  describe "#my_map" do
    it "returns nil array when block left empty" do
      expect([1,2,3].map{}).to eql([nil,nil,nil])
    end
    it "returns altared array based on block content" do
      expect([1,2,3].map{|n| n + 1}).to                  eql([2,3,4])
      expect([nil,nil].map{|space| space = "filled"}).to eql(["filled","filled"])
    end
  end
  
  describe "#my_inject" do
    it "handles emptry array" do
      expect([].my_inject{}).to eql(nil)
    end

    it "handles varius injections" do
      expect([1,2,3].my_inject{|sum, n| sum + n}).to eql(6)
      expect(["a","aa","aaa"].my_inject{|shortest, word| shortest < word ? shortest : word}).to eql("a")
    end

    it "handles being given a start value" do
      expect([2,3].my_inject(1){|sum, n| sum + n}).to eql(6)
    end
  end
end