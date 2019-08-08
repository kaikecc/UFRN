entity main is

port(SW : in  bit_vector(7 downto 0);
     HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
  
end;

architecture CKTO of main is 


component bloco is
 
port(A : in  bit_vector(3 downto 0);
     S : out bit_vector(3 downto 0));    

end component;

signal bintodec : bit_vector(11 downto 0);
signal AUX1, AUX2, AUX3, AUX4, AUX5, AUX6, AUX7: bit_vector(3 downto 0);


begin
  
 
B1: bloco port map(
A(2 downto 0) => SW(7 downto 5),
A(3) => '0', 
S => AUX1);
   
B2: bloco port map( 
A(0) => SW(4),
A(3 downto 1) => AUX1(2 downto 0),
S => AUX2);
   
B3: bloco port map(
A(0) => SW(3),
A(3 downto 1) => AUX2(2 downto 0),
S => AUX3);

B4: bloco port map(
A(0) => AUX3(3),
A(1) => AUX2(3),
A(2) => AUX1(3),
A(3) => '0',
S => AUX4);
  
B5: bloco port map(
A(0) => SW(2),
A(3 downto 1) => AUX3(2 downto 0),
S => AUX5);
  
   
B6: bloco port map( 
A(0) => AUX5(3),
A(3 downto 1) => AUX4(2 downto 0),
S => AUX6 );

B7: bloco port map( 
A(0) => SW(1), 
A(3 downto 1) => AUX5(2 downto 0),
S => AUX7);

-- PRIMIERO DIGITO
   bintodec(0) <= SW(0);
   bintodec(1) <= AUX7(0);
   bintodec(2) <= AUX7(1);
   bintodec(3) <= AUX7(2);
-- SEGUNDO DIGITO
   bintodec(4) <= AUX7(3);
   bintodec(5) <= AUX6(0);
   bintodec(6) <= AUX6(1);
   bintodec(7) <= AUX6(2);
--TERCEIRO DIGITO
   bintodec(8) <= AUX6(3);
   bintodec(9) <= AUX4(3);
   bintodec(10) <= '0';
   bintodec(11) <= '0';
   
   
   HEX0(3 downto 0) <= bintodec(3 downto 0);
   HEX0(6 downto 4) <= '0';
   
   
   
   HEX1(3 downto 0) <= bintodec(7 downto 4);
   HEX1(6 downto 4) <= '0';
   
   
   
   HEX2(3 downto 0) <= bintodec(11 downto 8);
   HEX2(6 downto 4) <= '0';
   
   
end CKTO;


