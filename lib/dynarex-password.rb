#Â!/usr/bin/env ruby

# file: dynarex-password.rb

require 'dynarex'

class DynarexPassword

  attr_reader :dynarex

  def initialize()
    super()
  end
  
  def generate_lookup()
    @temp_list = []
    @dynarex = Dynarex.new('codes/code(index,value)')

    chars =  (0..9).to_a  + Array.new(7) + ('A'..'Z').to_a + Array.new(6) + ('a'..'z').to_a 
    @chars = (0..9).to_a  + ('A'..'Z').to_a + ('a'..'z').to_a 

    chars.each do |char|
      @dynarex.create index: char, value: get_random_chars(2) if char
    end    
  end
  
  def lookup(weak_password, file=nil)
    
    if file then
      dynarex = Dynarex.new file
    elsif @dynarex then
      dynarex = @dynarex
    else
      return 'please supply a lookup file'
    end
    
    string = weak_password.split(//).map do |char|
      dynarex.records[char][:body][:value]
    end
    
    string.join  
  end
  
  def save(filepath)   @dynarex.save filepath, pretty: true   end

  private
        
  def get_random_chars(size)

    newpass = Array.new(rand(size)+1, '').map{@chars[rand(@chars.size)]}.join

    # return the encryption providing it doesn't already exist in the lookup table.
    return !@temp_list.include?(newpass) ? newpass : get_random_chars(size) 

  end
    
end
