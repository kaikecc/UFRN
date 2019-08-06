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
signal AUX1     : bit_vector(3 downto 0);
signal AUX2     : bit_vector(3 downto 0);
signal AUX3     : bit_vector(3 downto 0);
signal AUX4     : bit_vector(3 downto 0);
signal AUX5     : bit_vector(3 downto 0);
signal AUX6     : bit_vector(3 downto 0);
signal AUX7     : bit_vector(3 downto 0);

begin
  
B1: bloco port map(
  A(0) => SW(5),
	A(1) => SW(6), 
	A(2) => SW(7),
	A(3) => '0',
	S(0) => AUX1(0),
	S(1) => AUX1(1),
	S(2) => AUX1(2),
	S(3) => AUX1(3) );
	
	B2: bloco port map(
  A(0) => SW(4),
	A(1) => AUX1(0), 
	A(2) => AUX1(1),
	A(3) => AUX1(2),
	S(0) => AUX2(0),
	S(1) => AUX2(1),
	S(2) => AUX2(2),
	S(3) => AUX2(3) );
	
	B3: bloco port map(
  A(0) => SW(3),
	A(1) => AUX2(0), 
	A(2) => AUX2(1),
	A(3) => AUX2(2),
	S(0) => AUX3(0),
	S(1) => AUX3(1),
	S(2) => AUX3(2),
	S(3) => AUX3(3) );
	
	B4: bloco port map(
  A(0) => AUX3(3),
	A(1) => AUX2(3), 
	A(2) => AUX1(3),
	A(3) => '0',
	S(0) => AUX4(0),
	S(1) => AUX4(1),
	S(2) => AUX4(2),
	S(3) => AUX4(3) );
	
	B5: bloco port map(
  A(0) => SW(2),
	A(1) => AUX3(0), 
	A(2) => AUX3(1),
	A(3) => AUX3(2),
	S(0) => AUX5(0),
	S(1) => AUX5(1),
	S(2) => AUX5(2),
	S(3) => AUX5(3) );
	
	B6: bloco port map(
  A(0) => AUX5(3),
	A(1) => AUX4(0), 
	A(2) => AUX4(1),
	A(3) => AUX4(2),
	S(0) => AUX6(0),
	S(1) => AUX6(1),
	S(2) => AUX6(2),
	S(3) => AUX6(3) );
	
  B7: bloco port map(
  A(0) => SW(1),
	A(1) => AUX5(0), 
	A(2) => AUX5(1),
	A(3) => AUX5(2),
	S(0) => AUX7(0),
	S(1) => AUX7(1),
	S(2) => AUX7(2),
	S(3) => AUX7(3) );
	
	bintodec(0) <= SW(0);
	bintodec(1) <= AUX7(0);
	bintodec(2) <= AUX7(1);
	bintodec(3) <= AUX7(2);
	bintodec(4) <= AUX7(3);
	bintodec(5) <= AUX6(0);
	bintodec(6) <= AUX6(1);
	bintodec(7) <= AUX6(2);
	bintodec(8) <= AUX6(3);
	bintodec(9) <= AUX4(3);
	bintodec(10) <= 0;
	bintodec(11) <= 0;
	
	
	HEX0(0) <= bintodec(0);
	HEX0(1) <= bintodec(1);
	HEX0(2) <= bintodec(2);
	HEX0(3) <= bintodec(3);
	HEX0(4) <= 0;
	HEX0(5) <= 0;
	HEX0(6) <= 0;
	
	HEX1(0) <= bintodec(4);
	HEX1(1) <= bintodec(5);
	HEX1(2) <= bintodec(6);
	HEX1(3) <= bintodec(7);
	HEX1(4) <= 0;
	HEX1(5) <= 0;
	HEX1(6) <= 0;
	
	HEX2(0) <= bintodec(8);
	HEX2(1) <= bintodec(9);
	HEX2(2) <= bintodec(10);
	HEX2(3) <= bintodec(11);
	HEX2(4) <= 0;
	HEX2(5) <= 0;
	HEX2(6) <= 0;
	
	
 
end CKTO;