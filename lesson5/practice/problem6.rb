munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |k, v|
  puts "Name: " + k + "  Age: " + v["age"].to_s + "  Gender:" + v["gender"]
end

munsters.each do |k, v|
  puts "Name: " + k + "  Age: " + v["age"].to_s + "  Gender:" + v["gender"]
end
