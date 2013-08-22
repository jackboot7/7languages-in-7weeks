# -*- coding: utf-8 -*-
# Excercises from the book Seven Languages in Seven Weeks by Bruce A. Tate
# Author: Luis Alberto Santana - @jackboot7
#
# Ruby - Day 2
#

# FIND
# Most of the 'Find" part is resolved by searching on the language reference.
# Using the 'irb' to practice.

# How to translate a hash to an array

def hash2array(_hash)
  _hash.collect
end

# Can you translate arrays to hases?
#
# The array must meet certain conditions:
# 1.  Be a collection
# 2.  Each element can be divided in two distingible "units"
# 3.  Of those "units", one is going to be used for the "key" role. The "unit"
#     used for key should be or unmutable or "hashable". Also, it should not be
#     repeated in any other element.

# Can you iterate through a hash?
# a_hash.each do |k, v|
#   puts "#{k} => #{v}"
# end

# DO
# E1

# Print the contents of an array of sixteen numbers, four numbers at a time,
# using just each. Now, do the same using each_slice in Enumerable.

# Using just "each"
input = (1..16).collect # Let's create an arbitrary sixteen elements array

puts 'Print the contents of an array of sixteen numbers, four numbers at a time, using just each'
c = Array.new
r = input.each do
  |i|
  c.push i
  if c.length ==  4
     puts c.inspect # Using the inspect method to print the array as an array,
                    # not just the elements.
     c = Array.new
  # else
  #    c # The residual
  #  
  # This "residual" technique is not working with "each". Seems that "each"
  # returns all the elements allways.
  end
end

puts

# Results Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each
[1, 2, 3, 4]
[5, 6, 7, 8]
[9, 10, 11, 12]
[13, 14, 15, 16]

# A bonus: Using just inspect, in order to avoid external variables
_array = (1..16).collect # Just creating an array
r = _array.inject([]) do |ac, e|
  ac.push e
  if ac.length == 4
    puts ac.inspect
    ac = []
  else
    ac # The residual
       # Here its working since inject seems to return the block return value
  end
end

puts r.inspect if r.length > 0 # What happens with a number of elements not
                               # multiple of 4?

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
    if not data.nil?
      pair = data.collect[0]
      @node_name = pair[0]
      child_array = pair[1]
      @children = []
      child_array.each do |k, v|
        @children.push Tree.new k => v
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

tree_data = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }
#tree_data = {'grandpa'=> {'dad'=>{}, 'uncle'=>{'child 1' => {}}}}


ruby_tree = Tree.new tree_data
puts ruby_tree.children.inspect

puts
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts
puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
  


# E3
# Write a simple grep that will print the lines of a ﬁle having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a ﬁle. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

def simple_grep(filename, string)
  puts "Search the string \"#{string}\" in the contents of the file \"#{filename}\""
  File.open(filename, 'r') do
    |f|
    ln = 0
    f.each_line do
      |l|
      ln += 1
      puts  "#{ln} - #{l}" if not /#{string}/.match(l).nil? 
    end
  end 
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

