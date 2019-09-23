ENTITY ffjk IS
port ( clk ,J ,K ,P ,C : IN BIT;
q : OUT BIT );
END ffjk ;
ARCHITECTURE ckt OF ffjk IS
SIGNAL qS : BIT;
BEGIN
PROCESS ( clk ,P ,C )
BEGIN
IF P = '0' THEN qS <= '1';
ELSIF C = '0' THEN qS <= '0';
ELSIF clk = '1' AND clk ' EVENT THEN
IF J = '1' AND K = '1' THEN qS <= NOT qS ;
ELSIF J = '1' AND K = '0' THEN qS <= '1';
ELSIF J = '0' AND K = '1' THEN qS <= '0';
END IF;
END IF;
END PROCESS ;
q <= qS ;
END ckt ;
