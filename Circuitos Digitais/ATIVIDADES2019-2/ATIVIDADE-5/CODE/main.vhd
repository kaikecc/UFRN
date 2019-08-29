entity modulo is
  
  port( B : in bit_vector(6 downto 0);
    
        VD, VU : out bit_vector(3 downto 0));
end;

architecture ckt1 of modulo is
  
component complemento2 is
  
  port( C : in bit_vector(6 downto 0);    
        R : out bit_vector(6 downto 0));
  end component;

component mux14x7 is
  
  port(A1, B1: in bit_vector(6 downto 0); 
  SEL1: in bit;    
  S1 : out bit_vector(6 downto 0));
  
end component;

component main_bin_bcd is

port(SW : in  bit_vector(7 downto 0);
     HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
  
end component;

signal  AUX: bit_vector(6 downto 0);
signal AUX2: bit_vector(6 downto 0);
signal AUX3: bit_vector(13 downto 0);

 begin

    
C: complemento2 port map(
    
    C(6 downto 0) => B(6 downto 0),
    R(6 downto 0) => AUX(6 downto 0));
    
M: mux14x7 port map(

A1(6 downto 0) => B(6 downto 0),
B1(6 downto 0) => AUX(6 downto 0),
SEL1 => B(6),
S1(6 downto 0) => AUX2(6 downto 0));
  


BB: main_bin_bcd port map(
  
    SW(0) => AUX2(0),
    SW(1) => AUX2(1),
    SW(2) => AUX2(2),
    SW(3) => AUX2(3),
    SW(4) => AUX2(4),
    SW(5) => AUX2(5),
    SW(6) => AUX2(6),
    SW(7) => '0',
    
    HEX0(0) => AUX3(0),
    HEX0(1) => AUX3(1),
    HEX0(2) => AUX3(2),
    HEX0(3) => AUX3(3),
    HEX0(4) => AUX3(8),
    HEX0(5) => AUX3(9),
    HEX0(6) => AUX3(10),
    
    HEX1(0) => AUX3(4),
    HEX1(1) => AUX3(5),
    HEX1(2) => AUX3(6),
    HEX1(3) => AUX3(7),
    HEX1(4) => AUX3(11),
    HEX1(5) => AUX3(12),
    HEX1(6) => AUX3(13));
      
  VU <= AUX3(3 downto 0);
  VD <= AUX3(7 downto 4);
  
end ckt1;
