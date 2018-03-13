HEX_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
              'a', 'b', 'c', 'd', 'e','f']

def create_uuid
  uuid =''  
  [8,4,4,4,12].each do |n|
    n.times{ uuid << HEX_DIGITS.sample}
    uuid << '-'
  end
  uuid.chop!
  uuid
end

puts create_uuid


