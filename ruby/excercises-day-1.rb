# Excercises from the book Seven Languages in Seven Weeks by Bruce A. Tate
# Author: Luis Alberto Santana - @jackboot7
#
# Ruby - Day 1
#

# FIND
# E1
# A method that substitutes part of a string
str = 'This is a string.'

# The method returns a copy with the first ocurrence of the pattern substituted.
str.sub('i', 'MM')
# => "ThMMs is a line."

# The method returns a copy with all the ocurrences of the pattern substituted.
str.gsub('i','MM')
# => "ThMMs MMs a strMMng."


# DO 
# E1
# Print the string "Hello, world."
puts "Hello, world."
# Hello, world.
# => nil


# E3
# For the string "Hello, Ruby.", find the index of the word "Ruby."
str = 'Hello, Ruby.'
str.index 'Ruby'
# => 7


# E4
# Print your name ten times.
# Using ranges and blocks.
(1..10).each {puts 'Luis'}
# Luis
# Luis
# Luis
# Luis
# Luis
# Luis
# Luis
# Luis
# Luis
# Luis
# => 0...10


# E5 
# Print the string "This is sentence number 1", where the number 1 changes from 1 to 10
# Using ranges and blocls.
(1..10).each {|i| puts "This is sentence number #{i}"}

# This is sentence number 1
# This is sentence number 2
# This is sentence number 3
# This is sentence number 4
# This is sentence number 5
# This is sentence number 6
# This is sentence number 7
# This is sentence number 8
# This is sentence number 9
# This is sentence number 10
# => 1..10

# E6
# Run a Ruby program from a file.
# ruby day1.rb

# E7
# Bonus problem: Write a program that picks a random number. Let a player guess the number, 
# telling the player wheter the guess is too low or too high.

def play(maxi)
     guess = -1
     n = rand(maxi)
     until guess == n do
       puts"Enter the a number between 1 and 15:"
       guess = gets.to_i
       puts "Your number is lower" if guess < n
       puts "Your number is higher" if guess > n
       puts "You won!" if guess == n
     end
end

play(15)
