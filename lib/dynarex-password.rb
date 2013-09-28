#!/usr/bin/env ruby

# file: dynarex-password.rb

require 'dynarex'

class DynarexPassword

  attr_reader :dynarex

  def initialize()
    super()
  end
  
  # if a fized size of 2 is passed in then each character will generate 
  #   exactly 2 random alphanumeric characters
  #
  def generate_lookup(fixed_size=nil)
    
    @fixed_size = fixed_size
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
      char[/[0-9A-Za-z]/] ? dynarex.records[char][:body][:value] : char
    end
    
    string.join  
  end

  # reverse_lookup can only be used with a lookup file which was generated 
  #   with a fixed char length of 2
  #
  def reverse_lookup(password, file=nil)
    
    if file then
      dynarex = Dynarex.new file
    elsif @dynarex then
      dynarex = @dynarex
    else
      return 'please supply a lookup file'
    end
    
    h = dynarex.to_h.inject({}){|r, x| r.merge({x[:value] => x[:index]})}

    password.split('-').map do |linex| 
      linex.split('_').map do |x|
        x.split(//).each_slice(2).map {|chars| h[chars.join]}.join 
      end.join '_'
    end.join '-'

  end  
  
  def save(filepath)   @dynarex.save filepath  end

  private
        
  def get_random_chars(upper_size)

    size = @fixed_size ? @fixed_size : rand(upper_size)+1
    newpass = Array.new(size, '').map{@chars[rand(@chars.size)]}.join

    # return the encryption providing it doesn't already exist in the lookup table.
    return !@temp_list.include?(newpass) ? newpass : get_random_chars(size) 

  end
    
end
