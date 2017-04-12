#
# Copyright (C) 2017 Jean-Sebastien Fauteux
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

#names are seperated by line ending in the file
#every entry is specified like this: 		id:name

if ARGV.length < 3
	print "Use this script like this: ruby selector.rb <name_file> <teamcount> <teamsize>"
	exit(1)
end

names = Hash.new

lines = File.readlines('names.txt')

lines.each do |l|
	name = l.split(':')
	names[name[0]] = name[1]
end

open("teams.txt", 'w')

for i in 1..ARGV[1].to_i
	team = Hash.new

	team.merge!(names.to_a.sample(ARGV[2].to_i).to_h)
	team.each{ |k, v| names.delete(k)}	

	open("teams.txt", 'a') {|f|
		print "TEAM #{i}\n"
		f << "TEAM #{i}\n"
		team.each{ |k,v|
			print v
			f << v
		}
		f << "\n"
		print "\n"
	}

end