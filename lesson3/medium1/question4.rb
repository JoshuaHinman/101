def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# buffer << new_element - this will mutate and return the buffer passed to the method

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# buffer = input_array + [new_element] - this will create a copy of the buffer,
#           alter it and return it.  It will not change the original buffer 