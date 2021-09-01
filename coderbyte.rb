response = { name: { first_name: 'Jonh', mid_name: '', last_name: 'Smith' }, age: '45', smoker: 'N/A', college: { grade: '', university: 'Yale', nested: { key: '' }  }, hobbies: ['games', 'read', '-'] }

def filter!(response)
  response.reject! { |key, value| ['N/A', '-', ''].include?(value) if value.is_a?(String) }
  response.each do |key, value|
    value.delete_if { |v| ['N/A', '-', ''].include?(v) } if value.is_a?(Array)
    filter!(value) if value.is_a?(Hash)
  end
end

puts response
puts filter!(response)
