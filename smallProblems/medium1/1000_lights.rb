def switch_lights(step, lights)
  idx = 0
  while idx < lights.length
    lights[idx] ? lights[idx] = false : lights[idx] = idx
    idx += step
  end
end

def n_lights(n)
  lights = Array.new(n, false)
  1.upto(n) do |step|
    p step, lights
    switch_lights(step, lights)
  end
  lights.select{|val| val}
end

p n_lights(5)