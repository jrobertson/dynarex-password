#Introducing the Dynarex-password gem

Generate a Dynarex password lookup file and use it to make strong passwords from weak passwords.

In the following example a password lookup file is generated using random 1 or 2 alphanumeric digits associated with each literals a-z, A-Z, and 0-9.

    require 'dynarex-password'

    dp = DynarexPassword.new
    dp.generate_lookup
    dp.save 'lookup.xml'

    dp = DynarexPassword.new
    dp.lookup('apple', 'lookup.xml') #=> "lEtEtqcD" 

Note: Make sure you keep your password lookup file private.
