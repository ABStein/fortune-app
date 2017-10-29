require 'rspec'

class ChangeMachine
  def change(cents)
    array = []
    (cents -= 25; array << 25) while cents >= 25  
    (cents -= 10; array << 10) while cents >= 10       
    (cents -= 5; array << 5) while cents >= 5
    (cents -= 1; array << 1) while cents >= 1
    array
  end
end

RSpec.describe ChangeMachine do
  describe '#change' do
    let(:change_machine) {ChangeMachine.new}
    it 'should give you 25 when given 25' do
      expect(change_machine.change(25)).to match_array([25])
    end

    it 'should give you an array of 10 when given 10' do
      expect(change_machine.change(10)).to match_array([10])
    end

    it 'should give you an array of 5 when given 5' do
      expect(change_machine.change(5)).to match_array([5])
    end

    it 'should give you an array of 1 when given 1' do
      expect(change_machine.change(1)).to match_array([1])
    end

    it 'should return an array of [1, 1] if given 2 cents' do
      expect(change_machine.change(2)).to match_array([1, 1])
    end

    it 'should return an array of [5, 1] if given 6' do 
      expect(change_machine.change(6)).to match_array([5,1])
    end

    it 'should retrun an array of [10, 1] if given 11' do
      expect(change_machine.change(11)).to match_array([10,1])
    end

    it 'should return an array of [10, 5, 1] if given 16' do
      expect(change_machine.change(16)).to match_array([10,5,1])
    end
    it 'should return an array of [10, 10, 1] if given 21' do 
      expect(change_machine.change(21)).to match_array([10,10,1])
    end

    it 'should return an array of [25, 1] if given 26' do
      expect(change_machine.change(26)).to match_array([25,1])
    end

    it 'should return an array of [25, 25] if given 50' do
      expect(change_machine.change(50)).to match_array([25,25])
    end

    it 'should return an array of [25, 25, 1] if given 51' do
      expect(change_machine.change(51)).to match_array([25,25,1])
    end
    it 'should return an array of [25,25,25,25,10,5,1,1,1,1] if given 119' do
      expect(change_machine.change(119)).to match_array([25,25,25,25,10,5,1,1,1,1])
    end
  end
end