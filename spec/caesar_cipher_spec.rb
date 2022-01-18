require './lib/enigma'
require './lib/caesar_cipher'

RSpec.describe CaesarCipher do
  before (:each) do
    @caesar_cipher = CaesarCipher.new("hello, world", "02715", "040895")
  end

  it "exists" do
    expect(@caesar_cipher).to be_instance_of CaesarCipher
  end

  it "has a message" do
    expect(@caesar_cipher.message).to be_instance_of String
    expect(@caesar_cipher.message).to eq("hello, world")
  end

  it "has a key" do
    expect(@caesar_cipher.key).to be_instance_of String
    expect(@caesar_cipher.key).to eq("02715")
  end

  it "has a date" do
    expect(@caesar_cipher.date).to be_instance_of String
    expect(@caesar_cipher.date).to eq("040895")
  end

  it "validates date" do
    @caesar_cipher = CaesarCipher.new("hello, world", "02715", "000032")
    expect(@caesar_cipher.valid_date?).to eq(true)
    @caesar_cipher = CaesarCipher.new("hello, world", "02715", "000031")
    expect(@caesar_cipher.valid_date?).to eq(false)
  end

  it "pads offsets" do
    expect(@caesar_cipher.pad_offset(0)).to eq('0000')
    expect(@caesar_cipher.pad_offset(999)).to eq('0999')
  end

  it "builds the offset" do
    expect(@caesar_cipher.build_offsets).to be_instance_of Array
    expect(@caesar_cipher.build_offsets.length).to eq(4)
    expect(@caesar_cipher.build_offsets).to eq([1,0,2,5])

    @caesar_cipher = CaesarCipher.new("hello, world", "02715", "000000")
    expect(@caesar_cipher.build_offsets.length).to eq(4)
    expect(@caesar_cipher.build_offsets).to eq([0,0,0,0])
  end

  it "splits the offset" do
    expect(@caesar_cipher.split_offset(1672401025)).to be_instance_of Array
    expect(@caesar_cipher.split_offset(1672401025).length).to eq(4)
    expect(@caesar_cipher.split_offset(1672401025)).to eq([1,0,2,5])
  end

  it "builds the keys" do
    expect(@caesar_cipher.build_keys).to be_instance_of Array
    expect(@caesar_cipher.build_keys.length).to eq(4)
    expect(@caesar_cipher.build_keys).to eq([2, 27, 71, 15])
  end

  it "has no shifts by default" do
    expect(@caesar_cipher.shifts).to be_instance_of Array
    expect(@caesar_cipher.shifts.length).to eq(0)
    expect(@caesar_cipher.shifts).to eq([])
  end

  it "builds the shift" do
    @caesar_cipher.build_shifts
    expect(@caesar_cipher.shifts).to be_instance_of Array
    expect(@caesar_cipher.shifts.length).to eq(4)
    expect(@caesar_cipher.shifts).to eq([3, 27, 73, 20])
  end

  it "has an empty char_set by default" do
    expect(@caesar_cipher.char_set).to be_instance_of Array
    expect(@caesar_cipher.char_set.length).to eq(0)
    expect(@caesar_cipher.char_set).to eq([])
  end

  it "creates a character set" do
    @caesar_cipher.build_char_set
    expect(@caesar_cipher.char_set).to be_instance_of Array
    expect(@caesar_cipher.char_set.length).to eq(27)
    expect(@caesar_cipher.char_set).to eq(["a", "b", "c", "d", "e", "f", "g",
      "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
       "w", "x", "y", "z", " "])
  end

  it "has an empty char_hash by default" do
    expect(@caesar_cipher.char_set).to be_instance_of Array
    expect(@caesar_cipher.char_set.length).to eq(0)
  end

  it "creates a hash of characters" do
    @caesar_cipher.build_char_hash
    expect(@caesar_cipher.char_hash).to be_instance_of Hash
    expect(@caesar_cipher.char_hash.keys.length).to eq(27)
    expect(@caesar_cipher.char_hash['a']).to eq(0)
    expect(@caesar_cipher.char_hash[' ']).to eq(26)
  end

  it "shifts an index given an index and a shift" do
    @caesar_cipher.build_shifts
    @caesar_cipher.build_char_set
    @caesar_cipher.build_char_hash

    expect(@caesar_cipher.shift_index(0, 3)).to be_instance_of Integer
    expect(@caesar_cipher.shift_index(0, 3)).to eq(3)
    expect(@caesar_cipher.shift_index(27, 0)).to eq(0)
  end

  it "unshifts an index given an index and a shift" do
    @caesar_cipher.build_shifts
    @caesar_cipher.build_char_set
    @caesar_cipher.build_char_hash

    expect(@caesar_cipher.unshift_index(0, 3)).to be_instance_of Integer
    expect(@caesar_cipher.unshift_index(0, 3)).to eq(24)
    expect(@caesar_cipher.unshift_index(30, 3)).to eq(0)
  end

  it "encodes message" do
    @caesar_cipher.build_shifts
    @caesar_cipher.build_char_set
    @caesar_cipher.build_char_hash
    @caesar_cipher.encode_message

    expect(@caesar_cipher.output).to be_instance_of String
    expect(@caesar_cipher.output).to eq("keder, ohulw")
  end

  it "decodes message" do
    @caesar_cipher = CaesarCipher.new("keder, ohulw", "02715", "040895")
    @caesar_cipher.build_shifts
    @caesar_cipher.build_char_set
    @caesar_cipher.build_char_hash
    @caesar_cipher.decode_message

    expect(@caesar_cipher.output).to be_instance_of String
    expect(@caesar_cipher.output).to eq("hello, world")
  end
end
