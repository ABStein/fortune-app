require 'rspec'

  # make your own enumerables

  class Array
    # Research enumerables here if you are unfamiliar with them
    # (http://ruby-doc.org/core-2.3.1/Enumerable.html)

    # - you will need to use #another_each to make your enumerables work. 
    # - do not use the standard #each inside your new methods only use #another_each provided below <<<<<<<<<<<<<<<<<<<<<
    # - research what yield does in ruby and look at the #another_each example below for reference
    # def another_each
    #   self.length.times do |i|
    #     unless self[i] == "a"
    #       yield(self[i])
    #     end
    #   end
    # end


    # ["a","b","c","d","e"].another_each { |letter| p letter }


    # another_reject
    # Duplicates what the #reject method does. do not use #reject
    # Returns an array for all elements of enum for which the given block returns false.

    # Precode
    
    # Method
    # def another_reject
    #   self.length.times do |even|
    #     unless self[even] % 2 == 0
    #       yield(self[even])    
    #     end 
    #   end
    # end



    # [1,2,3,4,5,6,7,8].another_reject { |even| p even }

    # another_find
    # Duplicates what the #find method does. do not use #find
    # Returns the first element for which block is not false. if no element meets the criteria in the block #another_find will return nil
    
    # Precode
    
    # Method
    def another_find
      self.length.times do |i|
        yield(self[i])
      end
    end
 

    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15].another_find { |i| p i % 5 == 0 }

 

    # another_map
    # Duplicates what the #map method does. do not use #map
    # Returns a new array with the results of running block once for every element in the original array

    # Precode
    
    # Method
    def another_map
    end

    def another_select
    end

    def another_reduce #Bonus
    end

    def another_all? #Bonus
    end
  end

  #Driver Code

  RSpec.describe Array do
  let(:sample_array) { [1,2,3,4,5] }

  before :each do
    banned_methods = Enumerable.public_instance_methods + [:each]
    banned_methods.each do |method|
      expect(sample_array).to_not receive(method)
    end
  end

  describe '#another_each' do
    it 'should iterate through each element' do
      dest = []
      sample_array.another_each {|element| dest << element}
      expect(dest).to eq(sample_array)
    end
  end

  describe '#another_reject' do
    it "should produce a new array of elements that don't match the condition" do
      odds = sample_array.another_reject { |element| element.even? }
      expect(odds).to eq([1,3,5])
    end
  end

  describe '#another_find' do
    it 'should find the first element matching the condition' do
      four = sample_array.another_find { |element| element == 4 }
      expect(four).to eq(4)
    end
  end

  describe '#another_map' do
    it 'should produce a new array with the block applied to each element' do
      doubles = sample_array.another_map { |element| element * 2 }
      expect(doubles).to eq([2,4,6,8,10])
    end
  end

  describe '#another_select' do
    it 'should produce a new array of elements matching the condition' do
      evens = sample_array.another_select { |element| element.even? }
      expect(evens).to eq([2,4])
    end
  end

  pending '#another_reduce' do
    it 'should reduce an array using block' do
      sum = sample_array.another_reduce(0) { |total, element| total + element }
      expect(sum).to eq(15)
    end
  end

  pending '#another_all?' do
    it 'should return true if block is true for all elements' do
      expect(sample_array.another_all? {|element| element.is_a? Fixnum}).to be(true)
      expect(sample_array.another_all? {|element| element.is_a? String}).to be(false)
    end
  end
end