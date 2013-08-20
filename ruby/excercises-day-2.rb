# Excercises from the book Seven Languages in Seven Weeks by Bruce A. Tate
# Author: Luis Alberto Santana - @jackboot7
#
# Ruby - Day 2
#

# FIND
# Most of the 'Find" part is resolved by searching on the language reference.
# Using the 'irb' to practice.

# DO
# E1
# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
# Now, do the same using each_slice in Enumerable.

# Using just "each"
input = (1..16)

puts 'Print the contents of an array of sixteen numbers, four numbers at a time, using just each'
c = Array.new
cont = 0 
input.each do
  |i|
  c.push i
  cont= cont+1
  if cont ==  4
     puts c.inspect # Using the inspect method to print the array as an array, not just the elements.
     c = Array.new
     cont = 0
  end
end
puts

# Results
# Print the contents of an array of sixteen numbers, four numbers at a time, using just each
[1, 2, 3, 4]
[5, 6, 7, 8]
[9, 10, 11, 12]
[13, 14, 15, 16]


# Using "each_slice" in Enumerable

puts 'Print the contents of an array of sixteen numbers, four numbers at a time, using each_slice in Enumerable'
input.each_slice(4) {|s| puts s.inspect } 
puts

# Results
# Print the contents of an array of sixteen numbers, four numbers at a time, using each_slice in Enumerable
# [1, 2, 3, 4]
# [5, 6, 7, 8]
# [9, 10, 11, 12]
# [13, 14, 15, 16]



# E2
# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
# 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

class Tree
  attr_accessor :children, :node_name

  def initialize(data)
     if not  data.nil?
        data.each_pair do
          |k,v| 
          @node_name = k
          @children = v.each_pair  {|key,values| {key=>values} }
        end
     end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

#tree_data = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }
tree_data = {'grandpa'=> {'dad'=>{}, 'uncle'=>{}}}


#ruby_tree = Tree.new tree_data
#puts ruby_tree.children.inspect

#puts "Visiting a node"
#ruby_tree.visit {|node| puts node.node_name}

#puts "Visiting entire tree"
#ruby_tree.visit_all {|node| puts node.node_name}
  


# E3
# Write a simple grep that will print the lines of a ﬁle having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a ﬁle. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

def simple_grep(filename, string)
  puts "Search the string \"#{string}\" in the contents of the file \"#{filename}\""
  ln = 1
  file = open(filename, 'r')
  lines = file.readlines
  lines.each do
    |l| 
    puts  "#{ln} - #{l}" if not /#{string}/.match(l).nil? 
    ln = ln + 1
  end 
  file.close
  
  
  
end
# Running it against the tree.rb file using the children word.

simple_grep("tree.rb", "children")
puts

# Results:
#
# 9 -   attr_accessor :children, :node_name
# 11 -   def initialize(name, children=[])
# 12 -     @children = children
# 18 -     children.each {|c| c.visit_all &block }
#

