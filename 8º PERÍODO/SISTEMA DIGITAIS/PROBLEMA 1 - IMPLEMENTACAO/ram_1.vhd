--
-- Curso de FPGA WR Kits Channel
--
--
-- Aula 68: Síntese de Memórias RAM (Capítulo sobre Tipos e Pseudônimos livro D'Amore)
--           
--
-- Kit FPGA EE02-SOQ
--
-- Adquira em http://www.professoremersonmartins.com.br/site/prtoducts/KIT-FPGA-%252d-EE02-%252d-SOQ.html
--
--
-- Kit FPGA EE03
--
-- Adquira em http://www.professoremersonmartins.com.br/site/products/KIT-FPGA-%252d-EE03.html
--
--
-- Autor: Eng. Wagner Rambo     Data: Outubro de 2016
--
-- www.wrkits.com.br | facebook.com/wrkits | youtube.com/user/canalwrkits
--

	library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	
	
	entity ram_1 is
	port( dado_entrada  :  in  unsigned(3 downto 0);
	      dado_saida    : out  unsigned(3 downto 0);
			endereco      :  in  unsigned(2 downto 0);
			we, ce        :  in  std_logic);
	end ram_1;
	
	architecture hardware of ram_1 is
	  type  arranjo_memoria  is array(0 to 7) of unsigned(3 downto 0);
	  signal memoria : arranjo_memoria;
	  
	begin
	
	  process(ce, endereco)
	  begin
	  
	    if (ce' EVENT AND ce = '1') then -- dado armazenado na subida de "ce" com "we=0"
		  if we = '0' then memoria(to_integer(endereco)) <= dado_entrada;
		  end if;
		 end if;
		 
	  end process;
	  
	  dado_saida <= memoria(to_integer(endereco));
	  
	end hardware;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	