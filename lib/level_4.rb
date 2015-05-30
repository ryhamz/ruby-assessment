def grade_for (name, s)
  puts "In grade_for"
  #  return s[:students].select { |student| student(:name) == name} [:grade]
  return s[:students]
end

def find_instructor (name, s)
  puts "finding instructor"
  #  return  s[:instructors].select { |ins| ins(:name) == name}
  index = s[:instructors].index { |x| x(:name) == name}
  return s[:instructors][index]
end
