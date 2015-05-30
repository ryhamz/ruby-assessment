def grade_for (name, s)
  list =  s[:students]
  list.find { |i| i[:name] == name} [:grade]
end

def find_instructor (name, s)
  list = s[:instructors]
  list.find { |i| i[:name] == name}
end

def find_student (name, s)
  list = s[:students]
  list.find { |i| i[:name] == name}
end

def update_subject_for (name, sub, s)
  list = s[:instructors]
  list.find { |i| i[:name] == name} [:subject] = sub
end

def add_student (name, grade, s)
  s[:students].push({:name => name, :grade => grade})
end

def add_new_property(prop, val, s)
  s[prop] = val
end
