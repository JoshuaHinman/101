def case_percentage(string)
  lower_count = string.count("a-z")
  upper_count = string.count("A-Z")
  neither_count = string.length - lower_count - upper_count
  scale = 100.0 / string.length
  { lowercase: (lower_count * scale),
    uppercase: (upper_count * scale),
    neither:   (neither_count * scale)}
end
