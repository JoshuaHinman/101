hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], 
        third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []
hsh.values.flatten.each do |s|
  s.chars.each do |l|
    vowels << l if ['a','e','i','o','u'].include?(l.downcase)
  end
end

p vowels

# or
vowel_set = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowel_set.include?(char)
    end
  end
end



