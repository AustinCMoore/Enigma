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
    sequence('encrypt')
  end

  def decrypt
    sequence('decrypt')
  end

  def sequence(type)
    if type == 'encrypt'
      @data = @enigma.encrypt(@message, @key, @date)
    elsif type == 'decrypt'
      @data = @enigma.decrypt(@message, @key, @date)
    end
    write_file(type)
    print_to_user
  end

  def write_file(type)
    if type == 'encrypt'
      File.write(@output, data[:encryption])
    elsif type == 'decrypt'
      File.write(@output, data[:decryption])
    end
  end

  def print_to_user
    puts "Created #{@output} with the key #{@data[:key]} and date #{@data[:date]}"
  end

end
