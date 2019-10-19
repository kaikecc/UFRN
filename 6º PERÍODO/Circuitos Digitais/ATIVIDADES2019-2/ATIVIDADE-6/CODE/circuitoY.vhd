entity circuitoY is
  
port ( I: in bit_vector(3 downto 0);
      P: in bit_vector(1 downto 0);
      CLR2: in bit;
      clock1: in bit;
      S: out bit); 
  
end;

architecture cktY of circuitoY is
  
component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component; 

component cp4bit is
  port (
    E0: in bit_vector(3 downto 0);
    E1: in bit_vector(3 downto 0);
    E2: in bit_vector(3 downto 0);
    E3: in bit_vector(3 downto 0);    
    SS: in bit_vector(1 downto 0); -- SELETOR 2 BITS
    
    V: out bit_vector(3 downto 0));
end component;

signal OUTI: bit_vector(3 downto 0);
signal Qo: bit_vector(3 downto 0);

begin
  
   REG: reg4bit port map(
     
   clock2 => clock1,
   ENT(3 downto 0) => OUTI(3 downto 0),
   RESET => CLR2, -- MODIFICANDO
   Qs(3 downto 0) => Qo(3 downto 0));

 CP0: cp4bit port map(
  
  E0(3 downto 0) => Qo(3 downto 0),
  E1(3 downto 0) => I(3 downto 0),
  E2(2 downto 0) => Qo(3 downto 1),
  E2(3) => '0', -- VER ISSO
  
  E3(0) => '0',
  E3(1) => '0',
  E3(2) => '0',
  E3(3) => '0', -- testando
  SS(1 downto 0) => P(1 downto 0),
  V(3 downto 0) => OUTI(3 downto 0));
 

S <= Qo(0);

end cktY;
