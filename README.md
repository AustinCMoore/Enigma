# Enigma
## About

This application was built as part of the Turing School of Software and Design's Module 1 final project requirement. The project is made to model the Enigma machine which Alan Turing successfully cracked when he created the first computer. The cipher is a version of the Caesar cipher, where given a 5 digit key and a date formatted as DDMMYY, 4 unique shifts are produced which rotate through the message to encode or decode it. If a date is not provided, today's date is used. If a key is not provided, one is randomly generated. The character set is lowercase only, a to z with space included as the last character. Special characters are not altered, remain in place and the shift is not cycled.

## Built With

Ruby 2.7.2 and RSpec 3.10

## Getting Started

Clone this repository, then enter the following commands to your CLI:

to encrypt (key and date can be considered optional)

```ruby ./lib/encrypt.rb message.txt encrypted.txt key date```

to decrypt (date can be considered optional)

```ruby ./lib/decrypt.rb encrypted.txt decrypted.txt key date```

## Testing

Tests can be run with the following command: ```rspec```

## Self-Evaluation

One requirement of this project is to self evluate based on this rubric. Here are my self assigned scores and their justification.

### Functionality: Meets expectations.
All functionality is included up to the crack method. While I had a strong sense of how I wanted to build my crack functionality, I felt like I wouldd gain more from exploring/improving other aspects of the rubric, both as a function of my grade and in my desire to be fully prepared for continuing to Mod 2.

### Object Oriented Programming: Above expectations.
This will be my most subjective area of evaluation, as I believe my project does not demonstrate the understanding I have of these principles fully. This shortcoming is a product of the time requirement and a poor initial interpretation of the prompt, where I initially built this machine to be able to accept new charactersets, different type of ciphers and even dynamic shifts. This led to what I will admit is an overdesigned product. However, by framing from such a large scale I was able to better identify how to encapsulate different pieces of functionality, the value of abstraction, ways I could introduce inheritance and how I could use polymorphism to run these different types of ciphering processes.

### Ruby Conventions and Mechanics: Above expectations.
My largest method is 10, I was meticulous with my formatting and my processes were made with scalability in mind. I think my variable names have room for improvement, but that was again a function of time and doing multiple refactors over the course of a few days.

### Test Driven Development: Meets expectations.
Normally this is one of my strongest aspects of coding, but I found it difficult to keep organized through several iterations. I attempted to use mocks and stubs but had mixed results. My git history will show I always committed my tests first, however you will also notice I would commit my code to pass my test shortly after. While this may normally indicate straying from TDD, I want to assure the reader that I would build the test first, but I would often forget to commit it. Overall, despite the lack of discipline in my normally most disciplined area, my tests attained 100% coverage with SimpleCov, accounted for obvious edge cases where they existed, and each piece of functionality is tested.
