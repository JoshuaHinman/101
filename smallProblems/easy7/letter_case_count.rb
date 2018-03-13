def letter_case_count(string)
  result = {}
  result[:lowercase] = string.count("a-z")
  result[:uppercase] = string.count("A-Z")
  result[:neither] = string.count("^a-zA-Z")
  result
end

p letter_case_count('')