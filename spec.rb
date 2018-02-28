# Now it's time to get your hands dirty with a TDD exercise.
# Copy this code into a file, name it spec.rb.
# Install RSpec: gem install rspec
# Run the tests: rspec spec.rb
# Turn the pending specs into fleshed-out failing specs
# Run the tests, observe the failures
# Use red-green-refactor to implement the code to make the specs pass.
# Continue on to build out the as-yet-unwritten tests in the comments
# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.
require 'pry-byebug'

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    # binding.pry
    if @middle_name == ""
      "#{@first_name} #{@last_name}"
    else
    "#{@first_name} #{@middle_name} #{@last_name}"
  end
  end
  # implement your behavior here
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(
       first_name: "David",
       middle_name: "Heinemeier",
       last_name: "Hansson"
     )

     expect(person.full_name).to eq "David Heinemeier Hansson"
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(
       first_name: "John",
       middle_name: "",
       last_name: "Cena"
     )

     expect(person.full_name).to eq "John Cena"
    end

  end

  # describe "#full_name_with_middle_initial"
  #
  # describe "#initials"
end
