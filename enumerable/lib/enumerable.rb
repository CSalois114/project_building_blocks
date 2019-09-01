module Enumerable
    
    def my_each
      self.size.times {|index| yield(self[index])}
    end

    def my_each_with_index
      self.size.times {|index| yield(self[index], index)}
    end

    def my_select
      selection = []
      self.my_each { |elem| selection.push(elem) if yield(elem)}       
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

    def my_inject(start_value=nil)
      self.unshift(start_value) if start_value
      self.size.times do |index|
        self[index + 1] = yield(self[index], self[index + 1]) if self[index + 1]
      end
      self[-1]
    end
    
  end
