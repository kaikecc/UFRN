entity reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end;

architecture ckto of reg4bit is
  
  component ffd IS
port ( clk ,D ,P , C : IN BIT ;
q : OUT BIT );
end component;

signal Q: bit_vector(3 downto 0);


  begin
    
   D0: ffd port map(
   clk => clock2,
   D => ENT(0),
   P => '1', -- VERIFICAR ISSO
   C => RESET, -- VERIFICAR ISSO
   q => Q(0));
   
  D1: ffd port map(
   clk => clock2,
   D => ENT(1),
   P => '1', -- VERIFICAR ISSO
   C => RESET, -- VERIFICAR ISSO
   q => Q(1));
   
  D2: ffd port map(
   clk => clock2,
   D => ENT(2),
   P => '1', -- VERIFICAR ISSO
   C => RESET, -- VERIFICAR ISSO
   q => Q(2));
   
  D3: ffd port map(
   clk => clock2,
   D => ENT(3),
   P => '1', -- VERIFICAR ISSO
   C => RESET, -- VERIFICAR ISSO
   q => Q(3));
   
 Qs <= Q; 
 
end ckto;
