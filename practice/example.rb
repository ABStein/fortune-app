class People
  def intialize(input_name, input_age, input_occupation)
    @name = input_name
    @age = input_age  
    @occupation = input_occupation
  end

  def name
    @name
  end

  def age
    @age
  end

  def occupation
    @occupation
  end

  def print_info
    "#{@name} is #{@age} years old. He works as a #{@occupation}" 
  end
end











person_1 = People.new(
                    name: "Andrew",
                    age: "25",
                    occupation: "Developer"
                    )



p person_1.print_info



