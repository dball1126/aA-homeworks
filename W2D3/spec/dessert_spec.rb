require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq(type)
    end
    
    it "sets a quantity" do
      expect(dessert.type).to eq(quantity)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.type).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect(dessert.quantity).to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("cheese")
      expect(dessert.ingredients).to include("cheese")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert.mix!
      expect(dessert.ingredients).to eq(dessert.ingredients.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(1000000000000)
      expect(dessert.eat).to raise_error(StandardError)
    end

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
