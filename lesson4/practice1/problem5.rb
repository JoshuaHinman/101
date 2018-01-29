hash = { a: 'ant', b: 'bear' }
h = hash.shift

hash[h[0]] = h[1]
p hash
p h
