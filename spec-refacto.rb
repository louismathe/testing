require 'pry-byebug'
class Person
  def initialize(args)
    @args = args
  end

  def full_name
    @args.values.select{|v| !v.empty? }.join(" ")
  end

  def full_name_with_middle_initial
    @args.map{|k, v| k == :middle_name ? v[0] : v }.join(" ")
  end

  def initials
    @args.values.map { |e| e[0]}.join
  end
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

  describe "#full_name_with_middle_initial" do
    it "returns first name, initial of middle name and last name with spaces" do
      person = Person.new(
       first_name: "David",
       middle_name: "Heinemeier",
       last_name: "Hansson"
     )

     expect(person.full_name_with_middle_initial).to eq "David H Hansson"
    end
      it "& handles missing middle names" do
    person = Person.new(
      first_name: "John",
      last_name: "Cena"
    )

    expect(person.full_name_with_middle_initial).to eq "John Cena"
  end
  end
  #
  describe "#initials" do
    it "concatenates first name initial, middle name initial, and last name initial with spaces" do
      person = Person.new(
       first_name: "David",
       middle_name: "Heinemeier",
       last_name: "Hansson"
     )

     expect(person.initials).to eq "DHH"
    end

    it "& handles missing middle names" do
      person = Person.new(
        first_name: "John",
        last_name: "Cena"
      )

    expect(person.initials).to eq "JC"
    end
  end

end
