entity com_serial is
  
  port(A : in bit_vector(3 downto 0);
       K : in bit_vector(1 downto 0);
       clockk : in bit;
       Z : out bit_vector(3 downto 0));
  
end;

architecture ckt_serial of com_serial is
  
component circuitoX is
  
port ( U: in bit;
      CLR1: in bit;
      clckk: in bit;
      
      L: out bit_vector(3 downto 0));
  
end component;

component circuitoY is
  
port (I: in bit_vector(3 downto 0);
      P: in bit_vector(1 downto 0);
      CLR2: in bit;
      clock1: in bit;
      S: out bit); 
  
end component;

signal R: bit;
signal SERIAL: bit;
signal VALOR: bit_vector(3 downto 0);

begin

R <= not(K(0)) or not(K(1));

CY: circuitoY port map(
I(3 downto 0) => A(3 downto 0),
P(1 downto 0) => K(1 downto 0),
CLR2 => R,
clock1 =>  clockk,
S => SERIAL);

CX: circuitoX port map(
  U => SERIAL,
  CLR1 => R,
  clckk =>  clockk,
  L => VALOR);
  
  Z <= VALOR;
  
end ckt_serial;

