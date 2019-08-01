module Enumerable
    
    def my_each
      self.size.times {|index| yield(self[index])}
    end

    def my_each_with_index
      self.size.times {|index| yield(self[index], index)}
    end

    def my_select
      selection = []
      self.my_each { |elem| selection << elem if yield(elem)}       
      selection
    end 

    def my_all?
      self.my_each { |elem| return false if yield(elem) == false}
      true
    end

    def my_any?
      self.my_each { |elem| return true if yield(elem)}
      false
    end
      
    def my_none?
      self.my_any? {|elem| yield(elem)} == false ? true : false
    end

    def my_count
      count = 0
      self.my_each {|elem| count += 1}
      count
    end

    def my_map(*my_proc)
      result = []
        self.my_each {|elem| result << proc.call(elem)}
      result
    end

    def my_inject(init=0)
      result = self[init]
      self[init..-1].size.times do |index| 
        result = yield(result, self[index + 1]) if self[index + 1]
      end
      result
    end
    
  end
