require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before (:each) do
    @enigma = Enigma.new
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
  end

  it "can encrypt a message with a key and date" do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to be_instance_of Hash
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it "can decrypt a message with a key and date" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to be_instance_of Hash
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
      {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end

  it "can encrypt a message with a key" do
    @cipher = @enigma.encrypt("hello world", "02715", @enigma.todays_date)
    expect(@enigma.encrypt("hello world", "02715")).to eq(
      {
        encryption: @cipher[:encryption],
        key: "02715",
        date: @enigma.todays_date
      })
  end

  it "can decrypt a message with a key" do
    @encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(@encrypted[:encryption], "02715")).to be_instance_of Hash
    expect(@enigma.decrypt(@encrypted[:encryption], "02715")).to eq(
      {
        decryption: "hello world",
        key: "02715",
        date: @enigma.todays_date
      })
  end

  it "can encrypt a message" do
    allow(@enigma).to receive(:make_key).and_return('02715')
    @encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.encrypt("hello world")).to be_instance_of Hash
    expect(@enigma.encrypt("hello world")).to eq(
      {
        encryption: @encrypted[:encryption],
        key: '02715',
        date: @enigma.todays_date
      })
  end
end
