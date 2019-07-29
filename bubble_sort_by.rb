def bubble_sort_by(array)
  (array.length - 1).times do |times|    
    (array.length - times).times do |index|
      if array[index + 1]
        if yield(array[index], array[index +1]) > 0
          array[index], array[index + 1] = array[index + 1], array[index]
        end
      end
    end
  end 
  array 
end
  
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end