def repeater(string)
  double = ''
  string.split('').each do |ch|
    double << ch << ch
  end
  double
end

p repeater("This is test #1!")