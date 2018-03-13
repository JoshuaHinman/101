hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr2 = hsh.map do |k,v|
  if v[:type] == 'fruit'
    v[:colors].map {|c| c.capitalize}
  elsif v[:type] == 'vegetable'
    v[:size].upcase
  end
end
p arr2