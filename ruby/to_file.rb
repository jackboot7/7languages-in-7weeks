#
# Transcript of the book Seven Languages in Seven Weeks
# Ruby - Day 2
# Page 44 - Modules
#


module ToFile
  def filename
    "object_#{self.object_id}.txt" 
  end

  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end 

  def to_s
    name
  end
end

Person.new("matz\n").to_f
Person.new("luis\n").to_s
