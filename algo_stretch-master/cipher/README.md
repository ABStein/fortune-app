# Cipher Challenge

## Summary
Cryptography is all about the art of creating and decoding secret messages, called ciphers. Modern computers were born from advancements in cryptography.

In this challenge, you'll work with a pair to refactor some existing cryptography code to make it more readable and follow Ruby best practices. This is a long method. Use your newly-developed skills with classes and driver test code to break this code into a class structure and call the methods within it.

## Release 0: Run the code
Run the code in [my_solution.rb](my_solution.rb) and see what the expected output is.

## Release 1:  Comment the code
Write comments next to or above each line in the [my_solution.rb](my_solution.rb) file with an explanation.
Really focus on breaking each step down. You want to fully understand and explain every line.

## Release 2: Write additional tests
Create some input messages of your own and see what comes out. What will always be the same using this cipher? What changes? Write driver test code in the [my_solution.rb](my_solution.rb) file based on what you discover.

## Release 3: Refactor the initial solution
Rewrite the method in the [my_solution.rb](my_solution.rb) file. Be sure to do the following:

  - Clean up the variable names.
  - The original code used a hard-coded hash to do the encryption. Can you create a simple algorithm instead? The original shift was by 4 characters. What would happen if it was changed to 10? Would your class be able to handle that change easily?
