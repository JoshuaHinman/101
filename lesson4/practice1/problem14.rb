ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
num = 90000
ages.each do |k, v|
  p num
  num = v if num > v
end
 p num

p ages.values.min