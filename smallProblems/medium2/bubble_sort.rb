def array_swap (arr, n1, n2)
  swap = arr[n1]
  arr[n1] = arr[n2]
  arr[n2] = swap
end

def bubble_sort (arr)
  end_range = arr.length - 2 
  loop do
    swap = false
    (0..end_range).each do |idx|
      if arr[idx] > arr[idx + 1]
        array_swap(arr, idx, idx + 1)
        # or this trick: arr[idx] , arr[idx+1] = arr[idx+1] , arr[idx]
        swap = true
      end
    end
    end_range -= 1 if end_range > 0
    break if swap == false
  end
end

array = [2,1,4,8,20, 30,7,6,3,5,9]

bubble_sort(array)

p array