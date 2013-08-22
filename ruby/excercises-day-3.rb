# -*- coding: utf-8 -*-
# Excercises from the book Seven Languages in Seven Weeks by Bruce A. Tate
# Author: Jesús Gómez - @jgomo3
#
# Ruby - Day 1
#

require 'acts_as_csv_module'

class CsvRow
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def method_missing field, *args
    @data[field.to_s]
  end
end

cr = CsvRow.new({"f1" => 123, "f2" => 321, "f3" => 432})
puts cr.f1

class RubyCsv

  def each
    @csv_contents.each do |csv_row|
      yield CsvRow.new(Hash[@headers.zip(csv_row)])
    end
  end
end

  
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each {|row| puts row.country}
