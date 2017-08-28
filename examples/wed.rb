class Shoe 
  def initialize(input_tied, input_owner, input_side)
    @tied = input_tied
    @owner = input_owner
    @side = input_side
  end

  def tie 
    @tied = true
  end

  def untie
    @tied = false
  end
end

joshs_shoe = Shoe.new(false, "Josh", "right") 
                      

p joshs_shoe

joshs_shoe.tie
p joshs_shoe


joshs_shoe.untie
p joshs_shoe