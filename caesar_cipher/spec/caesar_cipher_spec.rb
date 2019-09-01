require "./lib/caesar_cipher.rb"

describe "caesar_cipher(message, key)" do
	it "encrypts one word messages" do 
		expect(caesar_cipher("abc", 3)).to eql("def")
	end

	it "encrypts backwords" do
		expect(caesar_cipher("def", -3)).to eql("abc")
	end

	it "encrypts multi word messages" do
		expect(caesar_cipher("abc test", 3)).to eql("def whvw")
		expect(caesar_cipher("def whvw", -3)).to eql("abc test")
	end

	it "encrypts upper and lower case characters" do 
		expect(caesar_cipher("Abc Test", 3)).to eql("Def Whvw")
		expect(caesar_cipher("Def Whvw", -3)).to eql("Abc Test")
	end

	it "ignores punctuation and numbers" do
		expect(caesar_cipher("abc, 100!", 3)).to eql("def, 100!") 
	end 


	it "encrypts around around ends of alphabet" do
		expect(caesar_cipher("abc def", -3)).to eql("xyz abc")
		expect(caesar_cipher("xyz abc", 3)).to eql("abc def")
	end


end