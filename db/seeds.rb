# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Populate programs
Program.destroy_all
programs = ["2Y", "1Y", "MMM", "JD-MBA"]
programs.each do |program|
  p = Program.new
  p.name = program
  p.save
end
puts "There are now #{Program.count} programs registered"

# Populate sections
Section.destroy_all
sections = ["Poet", "Jive Turkey", "Big Dog", "Cash Cow", "Bucket", "Bullfrog", "Moose", "Highlander", "Roadrunner", "Hedgehog"]
sections.each do |section|
  s = Section.new
  s.name = section
  s.save
end
puts "There are now #{Section.count} sections registered"
