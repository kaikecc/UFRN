entity circuitoX is
  
port ( U: in bit;
      CLR1: in bit;
      clckk: in bit;
      
      L: out bit_vector(3 downto 0));
  
end;

architecture cktX of circuitoX is
  
component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component;

component cp2bit is
  port (EE: in bit_vector(3 downto 0);
        B : in bit_vector(3 downto 0);
        SLC: in bit;
        W : out bit_vector(3 downto 0));
   end component;

signal F: bit_vector(3 downto 0);
signal H: bit_vector(3 downto 0);


  begin
    
RR: reg4bit port map(
  
  clock2 => clckk,
  ENT(3 downto 0) => H(3 downto 0),
  RESET => CLR1, -- MODIFICANDO
  Qs(3 downto 0) => F(3 downto 0));
  
CP: cp2bit port map(
  
  EE(3 downto 0) => F(3 downto 0),
  B(2 downto 0) => F(3 downto 1),
  B(3) => U,
  SLC => '1', -- MUDAR ISSO LOGO
  W => H(3 downto 0));
  
  L <= F;
  
end cktX;