munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total = 0 
munsters.each{|k, v| total += v["age"] if v["gender"] == "male"}
p total

total = 0 
munsters.each_value{|v| total += v["age"] if v["gender"] == "male"}
p total

total = 0 
munsters.values.each{|v| total += v["age"] if v["gender"] == "male"}
p total