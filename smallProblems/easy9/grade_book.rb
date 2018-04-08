def grade_book(grade1, grade2, grade3)
  num =  (grade1 + grade2 + grade3) / 3
  if num >= 90 && num <= 100
    'A'
  elsif num >= 80 && num < 90
    'B'
  elsif num >= 70 && num < 80
    'C'
  elsif num >= 60 && num < 70
    'D'
  else
    'F'
  end
end

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p grade_book(95,95,95)
p grade_book(75,35,25)
p grade_book(55,85,75)
p get_grade(65,85,50)