entity cp4bits is
  
  port(CP : in bit_vector(31 downto 0);
        SELECIONAR: in bit_vector(2 downto 0);
        S_CPP: out bit_vector(3 downto 0));
  
end;
     
architecture cktto of cp4bits is
  
component mux8x1 is
  
  port( SELE: in bit_vector(2 downto 0);
        ENTRADA: in bit_vector(7 downto 0);
        SAIDAA: out bit);
        
end component;

signal S_CP: bit_vector(3 downto 0);

 begin 
  
  M8_0: mux8x1 port map(
    
    ENTRADA => CP(7 downto 0),
    SELE => SELECIONAR,
    SAIDAA => S_CP(0));
    
   M8_1: mux8x1 port map(
    
    ENTRADA => CP(15 downto 8),
    SELE => SELECIONAR,
    SAIDAA => S_CP(1));  
  
   M8_2: mux8x1 port map(
    
    ENTRADA => CP(23 downto 16),
    SELE => SELECIONAR,
    SAIDAA => S_CP(2));
    
     M8_3: mux8x1 port map(
    
    ENTRADA => CP(31 downto 24),
    SELE => SELECIONAR,
    SAIDAA => S_CP(3));
    
 S_CPP <=  S_CP;
   
end cktto;
