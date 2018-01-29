[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# returns [1, 2, 3] because 'hi' is truthy