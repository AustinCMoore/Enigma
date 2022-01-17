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
    @key     = argv[2]
    @date    = argv[3]
    @message = File.read(input)
    @enigma  = Enigma.new
    @data    = nil
  end

  def encrypt
    @data = @enigma.encrypt(@message, @key, @date)
    print_to_user
    File.write(@output, data[:encryption]) #boolean helper?
  end

  def decrypt
    @data = @enigma.decrypt(@message, @key, @date)
    print_to_user
    File.write(@output, data[:decryption]) #boolean helper?
  end

  def print_to_user
    puts "Created #{@output} with the key #{@data[:key]} and date #{@data[:date]}"
  end

end
