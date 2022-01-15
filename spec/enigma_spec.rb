require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before (:each) do
    @enigma = Enigma.new
    @key    = double("02715")
  end

  it "exists" do
    expect(@enigma).to be_instance_of Enigma
  end

  it "returns today's date as DDMMYY" do
    expect(@enigma.todays_date).to be_instance_of String
    expect(@enigma.todays_date.length).to eq(6)
    expect(@enigma.todays_date).to eq(Date.today.strftime"%d%m%y")
  end

  it "makes random key" do
    expect(@enigma.make_key).to be_instance_of String
    expect(@enigma.make_key.length).to eq(5)
    # expect(@enigma.make_key).to eq(@key)#mock method to be created
  end

  it "creates the offset" do
    expect(@enigma.create_offset("040895")).to be_instance_of Array
    expect(@enigma.create_offset("040895")).to eq([1,0,2,5])
  end

  it "returns a qty of digits" do
    expect(@enigma.return_digits(4, 1672401025)).to be_instance_of Array
    expect(@enigma.return_digits(4, 1672401025).length).to eq(4)
    expect(@enigma.return_digits(4, 1672401025)).to eq([1,0,2,5])
  end

  xit "can encrypt a message with a key and date" do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to be_instance_of Hash
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  xit "can decrypt a message with a key and date" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to be_instance_of Hash
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
      {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end

  xit "can encrypt a message with a key" do
    expect(@enigma.encrypt("hello world", "02715")).to eq(@enigma.encrypt(
        "hello world",
        "02715",
        @today
      ))
    # expect(@enigma.encrypt("hello world", "02715")).to eq(@enigma.encrypt(
    #   "hello world",
    #   "02715",
    #   (Date.today.strftime"%d%m%y").to_i
    #   ))
  end

  xit "can decrypt a message with a key" do
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_instance_of Hash
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(@enigma.decrypt(
        encrypted[:encryption],
        "02715",
        @today
      ))
    # expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(@enigma.decrypt(
    #   encrypted[:encryption],
    #   "02715",
    #   (Date.today.strftime"%d%m%y").to_i
    # ))
  end

  xit "can encrypt a message" do
    expect(@enigma.encrypt("hello world")).to be_instance_of Hash
    expect(@enigma.encrypt("hello world")).to eq(@enigma.encrypt(
      "hello world",
      @key,
      @today
      ))
    # expect(@enigma.encrypt("hello world")).to eq(@enigma.encrypt(
    #   "hello world",
    #   @enigma.encrypt("hello world")[:key],
    #   (Date.today.strftime"%d%m%y").to_i
    #   ))
  end
end
