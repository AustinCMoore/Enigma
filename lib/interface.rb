require_relative './enigma'

class Interface
  attr_reader :input,
              :output,
              :key,
              :date,
              :message,
              :enigma,
              :data


  def initialize(argv)
    @input   = argv[0]
    @output  = argv[1]
    @key     = argv[2] #optional
    @date    = argv[3] #optional
    @message = File.read(input) #rename
    @enigma  = Enigma.new
    @data    = nil
  end

  def encrypt#according to interaction pattern this is all thats needed. refactor goal, it can pass in a key and/or date the user gives us
    @data = @enigma.encrypt(@message)
    print_to_user
    File.write(@output, data[:encryption]) #boolean helper?
  end

  def decrypt#according to interaction pattern this is all thats needed. refactor goal, it run without date
    @data = @enigma.decrypt(@message, @key, @date)
    print_to_user
    File.write(@output, data[:decryption]) #boolean helper?
  end

  def print_to_user
    puts "Created #{@output} with the key #{@data[:key]} and date #{@data[:date]}"
  end

end
