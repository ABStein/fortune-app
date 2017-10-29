# Cipher Challenge

# Release 1 : Comment the code
# Write your comments on what each thing is doing.
# If you have difficulty, go into IRB and play with the methods.

def decoded_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",
            "h" => "d",
            "i" => "e",
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}

  input.each do |x| # What is #each doing here?
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # What is #each_key doing here?
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        decoded_sentence << x
        found_match = true
        break
      end
    end
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")

  return decoded_sentence # What is this returning?
end

puts "Decoding messages..."
puts decoded_cipher("fi%wyvi%xs^hvmro^csyv#szepxmri")
puts decoded_cipher("asa,&csy^qywx#lezi^er@eajyp^psx$sj%jvii#xmqi&sr#csyv*lerhw!")
puts decoded_cipher("xs*amr@xli%keqi,#csy@qywx#ompp&qi,&nslr#vsqivs.")
puts decoded_cipher("izivcfshc*ks@xs*gsppiki,#wxyhc*levh,%wxyhc#levh.")
puts decoded_cipher("ai@mrxirh^xs%fikmr&sr*xli&jmvwx^sj^jifvyevc@yrviwxvmgxih&wyfqevmri%aevjevi.")
puts 

# Release 3: Refactor the initial solution






# DRIVER TESTS GO BELOW THIS LINE
puts "Running tests for `decoded_cipher`..."
puts decoded_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true

# Release 2: Write additional tests
# Create more driver test code based on the decoded messages. Driver test code statements should always return "true."






puts
puts "Finished running tests."
