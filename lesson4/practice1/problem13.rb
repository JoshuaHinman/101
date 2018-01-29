ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.select { |k, v| v < 50 }

p ages.keep_if { |_, age| age < 50}
