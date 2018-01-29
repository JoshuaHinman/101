advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.split
i = advice.index("important")
advice.delete_at(i)
advice.insert(i, 'urgent')
advice = advice.join(' ')
puts advice

#advice.gsub!('important', 'urgent')