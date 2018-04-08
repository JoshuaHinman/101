CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def repeater(string)
  double = ''
  string.split('').each do |ch|
    double << ch
    if CONSONANTS.include?(ch.downcase)
      double << ch
    end
  end
  double
end

p repeater("This is test #2!")