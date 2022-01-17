require_relative './enigma'

class Interface
  attr_reader :input,
              :output,
              :key,
              :date,
              :message,
              :enigma


  def initialize(argv)
    @input   = argv[0]
    @output  = argv[1]
    @key     = argv[2]
    @date    = argv[3]
    @message = File.read(input)
    @enigma  = Enigma.new
  end

  def encrypt#according to interaction pattern this is all thats needed. refactor goal, it can pass in a key and/or date the user gives us
    data = @enigma.encrypt(@message)
    puts "Created #{@output} with the key #{data[:key]} and date #{data[:date]}"
    File.write(@output, data[:encryption])
  end

  def decrypt#according to interaction pattern this is all thats needed. refactor goal, it run without date
    data = @enigma.decrypt(@message, @key, @date)
    puts "Created #{@input} with the key #{data[:key]} and date #{data[:date]}"
    File.write(@output, data[:decryption])
  end

end
