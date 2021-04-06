#!/usr/bin/env ruby

# file: dynarex-password.rb

require 'dynarex'

class DynarexPassword
  using ColouredText

  attr_reader :dx

  def initialize(debug: false)
    
    @debug = debug
    puts 'inside DynarexPassword::initialize'.info if debug
    super()
  end
  
  # if a fized size of 2 is passed in then each character will generate 
  #   exactly 2 random alphanumeric characters
  #
  def generate_lookup(fixed_size: 2)
        
    @temp_list = []
    @dx = Dynarex.new('codes[fixedsize]/code(index,value)')
    @dx.fixedsize = @fixed_size = fixed_size

    chars =  (0..9).to_a  + Array.new(7) + ('A'..'Z').to_a \
                                               + Array.new(6) + ('a'..'z').to_a
    @chars = (0..9).to_a  + ('A'..'Z').to_a + ('a'..'z').to_a 

    chars.each do |char|
      
      s = get_random_chars(2)
      @temp_list << s
      @dx.create index: char, value: s if char
      
    end    
  end
  
  def lookup(weak_password, file=nil)
    
    dx = if file then
      Dynarex.new file
    elsif @dx
      @dx
    else
      raise 'dynarex-password: please supply a lookup file'.error
    end
    
    chars = weak_password.split(//).map do |char|
      char[/[0-9A-Za-z]/] ? dx.records[char][:body][:value] : char
    end
    
    chars.join  
  end

  alias encrypt lookup

  # reverse_lookup can only be used with a lookup file which was generated 
  #   with a fixed char length of 2
  #
  def reverse_lookup(password, file=nil)
    
    dx = if file then
      Dynarex.new file
    elsif @dx
      @dx
    else
      raise 'dynarex-password: please supply a lookup file'.error
    end
    
    fixed_size = (dx.summary[:fixedsize] || 2).to_i
    puts 'fixed_size: ' +fixed_size.inspect if @debug
    
    h = dx.to_a.inject({}){|r, x| r.merge({x[:value] => x[:index]})}

    password.split('-').map do |linex| 
      linex.split('_').map do |x|
        x.split(//).each_slice(fixed_size).map {|chars| h[chars.join]}.join 
      end.join '_'
    end.join '-'

  end

  alias decrypt reverse_lookup  
  
  def save(filepath)   @dx.save filepath end

  private
        
  def get_random_chars(upper_size)

    size = @fixed_size ? @fixed_size : rand(upper_size)+1
    newpass = Array.new(size, '').map{@chars[rand(@chars.size)]}.join

    # return the encryption providing it 
    #                                doesn't already exist in the lookup table.
    return !@temp_list.include?(newpass) ? newpass : get_random_chars(size) 

  end
    
end
