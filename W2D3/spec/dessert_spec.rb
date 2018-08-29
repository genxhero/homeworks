require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("Epic Win", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
    expect(dessert.type).to eq("Epic Win")
  end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
  end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Fail", :sym, chef) }.to raise_error(ArgumentError)
   end
end
  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Moxie")
      expect(dessert.ingredients.last).to eq("Moxie")
    end
  end

  describe "#mix!" do
#Some times gets muddled by the RNG as there is a small chance shuffle == sort
#Happened once during testing
    it "shuffles the ingredient array" do
      dessert.add_ingredient("Starfire")
      dessert.add_ingredient("Heavy Metal Essence")
      dessert.add_ingredient("Bacon")
      expect(dessert.mix!).to_not eq(dessert.ingredients.sort)
      dessert.ingredients.sort!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do

      expect { dessert.eat(9001) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jack Tenrec the Great Baker")
      expect(dessert.serve).to eq("Chef Jack Tenrec the Great Baker has made 10 Epic Wins!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end

end
