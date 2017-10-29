# def unicorn(word)
#   puts word
# end




# def horse(block_variable_1)
#   yield(block_variable_1)
# end



# # p horse { |num| num * 2 }






# class String
#   def first_letter(string)
#     self[0]
#   end
# end


# p "bob".first_letter
# p "nintendo".first_letter
# p "chicago".first_letter

class Array
  def my_each
    self.length.times do |index|
      unless self [index] == "d"
        yield(self[index])
      end
    end  
  end
end





# class Array
#   def my_each
#     puts "You win!"   
#   end
# end


["a","b","c","d","e"].my_each { |letter| p letter * 6 }


# do and end in one lined syntax equals a "{" and "}"