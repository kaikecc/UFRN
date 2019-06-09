
entity radar is
	port(Sensor_A_Caju, Sensor_B_Caju, clk1: in bit;
	Alert_A: out bit);

end radar;

architecture functionRadar of radar is

component ffd is
    port(clk,D,P,C : IN BIT;
         q : OUT BIT);

end component;

signal A, B, auxA, auxB: bit;

begin

auxA <= not Sensor_A_Caju;
auxB <= not Sensor_B_Caju;


SA: ffd port map(clk => clk1,
	D => '0', 
	P => auxA,
	C => '0', 
	q => A);

SB: ffd port map(clk => clk1,
	D => '0', 
	P => auxB, 
	C => '0',
	q => B);



Alert_A <= A and B;

end architecture functionRadar;