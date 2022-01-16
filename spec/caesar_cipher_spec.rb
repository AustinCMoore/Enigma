require './lib/enigma'
require './lib/caesar_cipher'

RSpec.describe CaesarCipher do
  before (:each) do
    @caesar_cipher = CaesarCipher.new("hello world", "02715", "040895")
    @keys = [2,27,71,15]
    @offsets = [1,0,2,5]
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
end
