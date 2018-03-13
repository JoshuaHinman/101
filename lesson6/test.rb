hand = [1,5,'a']
values = hand.clone
hand.each_with_index do |v|
  if v == 'a'
    values << values
    change first ace to 1
    change second ace to 11
  end
end

