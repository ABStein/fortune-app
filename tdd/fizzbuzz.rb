require 'rspec'

class Fizzbuzz
  def output(number)
    if number == 3
      "Fizz"
    else
  end

  def go
    (1..100).each do |number|
      puts output(number)
    end
  end
end

# Fizzbuzz.new.go

RSpec.describe Fizzbuzz do
  describe '#output' do
    it 'should return one if given 1' do
      fizzbuzz = Fizzbuzz.new
      expect(fizzbuzz.output(1)).to eq(1)
    end
  end
end