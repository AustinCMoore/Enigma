require './lib/enigma'
require './lib/caesar_cipher'

RSpec.describe CaesarCipher do
  before (:each) do
    @caesar_cipher = CaesarCipher.new("hello world", "02715", "040895")
    @keys = [2,27,71,15]
    @offsets = [1,0,2,5]
    @char_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
       "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
       "w", "x", "y", "z", " "]
  end

  it "exists" do
    expect(@caesar_cipher).to be_instance_of CaesarCipher
  end

  it "creates the offset" do
    expect(CaesarCipher.create_offset("040895")).to be_instance_of Array
    expect(CaesarCipher.create_offset("040895")).to eq([1,0,2,5])
  end

  it "splits the offset" do
    expect(CaesarCipher.split_offset(1672401025)).to be_instance_of Array
    expect(CaesarCipher.split_offset(1672401025).length).to eq(4)
    expect(CaesarCipher.split_offset(1672401025)).to eq([1,0,2,5])
  end

  it "splits the key" do
    expect(CaesarCipher.split_keys("02715")).to be_instance_of Array
    expect(CaesarCipher.split_keys("02715").length).to eq(4)
    expect(CaesarCipher.split_keys("02715")).to eq([2, 27, 71, 15])
  end

  it "finds the shift" do
    expect(CaesarCipher.find_shifts(@keys, @offsets)).to be_instance_of Array
    expect(CaesarCipher.find_shifts(@keys, @offsets).length).to eq(4)
    expect(CaesarCipher.find_shifts(@keys, @offsets)).to eq([3, 0, 19, 20])
  end

  it "creates a character set" do
    expect(CaesarCipher.make_char_set).to be_instance_of Array
    expect(CaesarCipher.make_char_set.length).to eq(27)
    expect(CaesarCipher.make_char_set).to eq(@char_set)
  end

  it "creates a hash of characters" do
    expect(CaesarCipher.make_char_hash(@char_set)).to be_instance_of Hash
    expect(CaesarCipher.make_char_hash(@char_set).keys.length).to eq(27)
    expect(CaesarCipher.make_char_hash(@char_set)['a']).to eq(0)
    expect(CaesarCipher.make_char_hash(@char_set)[' ']).to eq(26)
  end

  it "checks if character is valid" do
    expect(CaesarCipher.valid_char?('a')).to eq(true)
    expect(CaesarCipher.valid_char?(',')).to eq(false)
  end
end
