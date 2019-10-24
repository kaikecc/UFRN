entity controller is
  
  port(cc, mme, clocck: in bit; -- cc == c
                                -- mme == ME
   LD, CL, dd: out bit);
   
 end;  
 
architecture ckkto of controller is
  
component ffd IS
port ( clk ,D ,P , C : IN BIT ;
q : OUT BIT );
end component;

component combinational_logic is
  
  port(e0, e1, s0, s1: in bit;          -- e0 == c 
                                        -- e1 == tot_It_s, 
       ss1, ss2, ss3, n1, n0: out bit); -- ss1 == d
                                        -- ss2 == tot_ld
                                        -- ss3 == tot_clr
        
end component;
  
signal s: bit_vector(1 downto 0);
signal x: bit_vector(2 downto 0);
signal n: bit_vector(1 downto 0);

  begin
   
   COMBL: combinational_logic port map(
   
        e0 => cc,
        e1 => mme,
        
        s0 => s(0),
        s1 => s(1),
        
        ss1 => x(0), -- d
        ss2 => x(1), -- tot_ld
        ss3 => x(2), -- tot_clr
        
        n0 => n(0),
        n1 => n(1));
    
    -- Registrador de 2 bits
    
    F1: ffd port map(
    
     clk => clocck,
     D => n(0),
     P => '1', 
     C => '1',
     q => s(0));
    
    F2: ffd port map(
    
     clk => clocck,
     D => n(1),
     P => '1', 
     C => '1',
     q => s(1));
     
  -- Fim do Registrador de 2 bits
  
 dd <= x(0); 
 LD <= x(1);
 CL <= x(2); 
 
  
end ckkto;
    
