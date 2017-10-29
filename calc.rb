require 'rspec'


class Calculator
  def add(number_one, number_two)
    number_one + number_two
  end

  def subtract(number_one, number_two)
    number_one - number_two
  end

  def multiply(number_one, number_two)
    number_one * number_two
  end

  def divide(dividend, divisor)
    dividend / divisor
  end

  def square(number)
    number * number
  end

  def power(number, exponent)
    number ** exponent
  end

  def square_root(number)
    return power(number, 0.5)
  end

  def reverse(number)
    number.to_s.reverse.to_i
  end

  def times_by_zero(number)
    number * 0 
  end
end


# calculator = Calculator.new 

# puts "Testing the Calculator#add method"
# if calculator.add(1, 3) == 4
#   puts "Test Passes"
# else
#   puts "Test Failed"
# end



RSpec.describe Calculator do |variable|
  describe '#add' do
    it 'should return the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(1, 3)).to eq(4)
    end
  end

  describe '#subtract' do
  
    it 'should return the difference between 2 numbers' do
      calculator = Calculator.new
      expect(calculator.subtract(4, 1)).to eq(3)
    end
  end

  describe '#multiply' do
    it 'should return the product of 2 numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(4, 3)).to eq(12)
    end
  end

  describe '#divide' do
    it 'should return the qoutient of' do 
      calculator = Calculator.new
      expect(calculator.divide(4, 2)).to eq(2)
    end
  end

  describe '#square' do
    it 'should return the product of a number times itself' do 
      calculator = Calculator.new
      expect(calculator.square(3)).to eq(9)
    end
  end

  describe '#power' do
    it 'should return the power of the first to the second number' do 
      calculator = Calculator.new
      expect(calculator.power(2, 3)).to eq(8)
    end
  end

  describe '#square_root' do
    it 'should return the square root of a given number' do 
      calculator = Calculator.new
      expect(calculator.square_root(4)).to eq(2)
      expect(calculator.square_root(9)).to eq(3)
      expect(calculator.square_root(100)).to eq(10)
    end
  end

  describe '#reverse' do
    it 'should return the digits in reverse order' do 
      calculator = Calculator.new
      expect(calculator.reverse(56789)).to eq(98765)
    end
  end

  describe '#times_by_zero' do
    it 'should return the product of the number times zero' do 
      calculator = Calculator.new
      expect(calculator.times_by_zero(45)).to eq(0)
    end
  end


end