ENTITY ffd IS
port ( clk ,D ,P , C : IN BIT ;
q : OUT BIT );
END ffd ;
ARCHITECTURE ckt_ffd OF ffd IS
SIGNAL qS : BIT;
BEGIN
PROCESS ( clk ,P ,C )
BEGIN
IF P = '0' THEN qS <= '1';
ELSIF C = '0' THEN qS <= '0';
ELSIF clk = '1' AND clk ' EVENT THEN
qS <= D;
END IF;
END PROCESS;
q <= qS;
END ckt_ffd;
