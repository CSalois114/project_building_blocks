def bubble_sort(array)
  (array.length - 1).times do |times|   # length - 1 is the max needed
    (array.length - times).times do |index|
      if array[index + 1] 
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
        end
      end
    end
  end
  array
end

bubble_sort([4,3,78,2,0,2])