#Introducing the Dynarex-password gem

Generate a Dynarex password lookup file and use it to make strong passwords from weak passwords.

In the following example a password lookup file is generated using random 1 or 2 alphanumeric digits associated with each literals a-z, A-Z, and 0-9.

    dp = DynarexPassword.new
    puts dp.dynarex.to_xml pretty: true

    <?xml version='1.0' encoding='UTF-8'?>
    <codes>
      <summary>
        <recordx_type>dynarex</recordx_type>
        <format_mask>[!index] [!value]</format_mask>
        <schema>codes/code(index,value)</schema>
      </summary>
      <records>
        <code id='1' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>0</index>
          <value>L</value>
        </code>
        <code id='2' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>1</index>
          <value>eW</value>
        </code>
        <code id='3' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>2</index>
          <value>f</value>
        </code>
        <code id='4' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>3</index>
          <value>Sy</value>
        </code>
        <code id='5' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>4</index>
          <value>f</value>
        </code>
        <code id='6' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>5</index>
          <value>8</value>
        </code>
        <code id='7' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>6</index>
          <value>Gf</value>
        </code>
        <code id='8' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>7</index>
          <value>w</value>
        </code>
        <code id='9' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>8</index>
          <value>n</value>
        </code>
        <code id='10' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>9</index>
          <value>aE</value>
        </code>
     ...
        <code id='37' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>a</index>
          <value>0t</value>
        </code>
        <code id='38' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>b</index>
          <value>D</value>
        </code>
        <code id='39' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>c</index>
          <value>k1</value>
        </code>
        <code id='40' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>d</index>
          <value>az</value>
        </code>
        <code id='41' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>e</index>
          <value>J</value>
        </code>
        <code id='42' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>f</index>
          <value>N1</value>
        </code>
        <code id='43' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>g</index>
          <value>7v</value>
        </code>
        <code id='44' created='2012-05-04 19:15:24 +0100' last_modified=''>
          <index>h</index>
          <value>c</value>
        </code>
    ...

    dp.dynarex.records['f'][:body][:value] #=> "N1"

    dp.save 'password_lookup.xml'
