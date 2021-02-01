	
	 library ieee;
		 use ieee.std_logic_1164.all;
	
	
	entity mde is
	port ( ck, b_on,b_next,b_back,play,cont_local_10,cont_on_5,it_comparador,grt_comparador,eq_comparador,nova_msg: in bit;
	 F_led,M_led,P_led,O_led,R_led,ld_display_val,r_w,en,DISPLAY_EN,sub_display,erase_MEM,sum_Display,clr_addr,setUni,sl_comp1,sl1_comp1,sl2_com1,s_comp1,s1_comp1,s2_comp1,clr_Cont_local,clr_CT_ON,clr_CT_Msg,clr_CT_INAT,en_CT_INAT,en_Cont_local,en_CT_Msg,en_CT_ON,ld_REGS_REP_SQ,ld_REGS_REP_S,ld_REGS_GRV,Flag_rep_s,Flag_rep_sq,clr_REGS_REP: out bit);
	end mde ;
	architecture logica of mde is
		type st is (Checkin,Ligar,Repouso,Cheio,Check,soma,Display_val_soma,addr,Gravar,Pause,Produzir_SQ,Produzir_S,setPonteiro,cont,resetar,desligar,e_next,setnext,setDisplay_val,e_back);
	
		signal estado: st;
		signal r_tudo,p_p,flag_next,ld_addr: bit
	
		begin
	
		process (ck,b_on)
	
		begin
	
			if b_on = '1' then
			estado <= Checkin ;
			elsif (ck'event and ck= '1') then
	
		case estado is
		when Checkin  =>
			estado <= Ligar;
	
		when Ligar =>
			if eq_comparador = '1' then estado <= Repouso;
			elsif b_on = '1' then estado <= cont;
			elsif (play = '1' and  r_tudo = '1' and M_led = '1') then estado <= Produzir_SQ;
			elsif (play = '1' and  r_tudo = '0' and M_led = '1') then estado <= Produzir_S;
			elsif (b_next = '1' and M_led = '1')  then estado <= e_next;
			elsif (b_back = '1' and M_led = '1')  then estado <= e_back;
			end if;
	
		when Repouso =>
			if b_on = '1' then estado <= Ligar;
			elsif(nova_msg = '1' and b_on = '0' and F_led ='0') then estado <= Gravar;
			end if;
	
		when Cheio =>
			estado <= Repouso;
	
		when Check =>
			if eq_comparador = '1' then estado <= Cheio;
			elsif it_comparador = '1' then estado <= Repouso;
			end if;
	
	
		when soma =>
			if (eq_comparador = '1' and cont_local_10 = '1' and  P_led= '1')  then estado <= Ligar;
			elsif (cont_local_10 = '1' and Flag_rep_sq = '1') then estado <= Display_val_soma;
			elsif (cont_local_10 = '1'  and P_led= '0') then estado <= Check;
			elsif (play = '1'  P_led= '1') then estado <= Pause;
			elsif it_comparador = '1' then estado <= addr;
			end if;
	
		when Display_val_soma =>
			estado <= addr;
	
		when addr =>
			if (play = '1'  P_led= '1') then estado <= Pause;
			else  estado <= Display_val_soma;
			end if;
	
		when Gravar =>
			estado <= addr;
	
		when Pause =>
			if (play ='1' and p_p = '1') then estado <= addr;
			elsif ((play ='1' and p_p = '0') then estado <= Display_val_soma;
			end if;
	
		when Produzir_SQ =>
			estado <= addr;
			
		when Produzir_S =>
			estado <= setPonteiro;
	
	
		when setPonteiro =>
			estado <= addr;
	
		when  cont =>
			if (b_on = '0' and it_comparador = '0' and cont_on_5 = '1') then estado <= resetar;
			elsif (b_on = '0' and cont_on_5 = '0') then estado <= desligar;
			elsif (b_on = '0' and it_comparador = '1') then estado <= Repouso;
			end if;
		when resetar =>
			estado <= Ligar;
	
		when desligar =>
			if b_on = '1' then estado <= Checkin;
			end if;
	
		when e_next =>
			if it_comparador = '0' then estado <= Ligar;
			elsif (it_comparador = '1' and flag_next = '0') then estado <= setnext;
			elsif (it_comparador = '1' and flag_next = '1') then estado <= setDisplay_val;
			end if;
	
		when setnext =>
			estado <= Ligar;
	
		when  setDisplay_val =>
			estado <= Ligar;
	
		when  e_back =>
			if grt_comparador = '0' then estado <= Ligar
			elsif grt_comparador = '1' then estado <= setDisplay_val
			end if;
	
	
		end case;
		end if;
		end process;
	
		with estado select
	
			ld_display_val <= '1' when Checkin,
					  '1' when Produzir_SQ,
					  '1' when setDisplay_val,
					  '1' when setnext,
						  '0' when Ligar,
					  '1' when Display_val_soma;
	
			sum_Display <= '0' when Checkin,
						 '1' when Display_val_soma,
						 '1' when e_next;
			
			setUni <= '0' when Checkin,    
				  '1' when Produzir_SQ,
				  '1' when setnext;
	
			r_tudo <= '1' when Checkin,
				  '0' when setDisplay_val,
				  '1' when resetar,
				  '0' when setnext;
	
			sub_display <= '0' when e_back,
								'0' when Checkin,
						 '1' when Display_val_soma;
	
			P_led <= '0' when Repouso,
				 '1' when Produzir_SQ,
				 '1' when Produzir_S,
				 '0' when Ligar,
				 '0' when e_back;
	
			O_led <= '1' when Ligar;
			
			clr_CT_ON <= '1' when Ligar,
					  '1' when desligar;
	
			s_comp1 <= '0' when Ligar,
					'0' when setnext,
					'0' when cont,
					'1' when soma,
						  '0' when Check;
	
			s1_comp1 <= '0' when Ligar,
					'0' when setnext,
					'1' when cont,
					'1' when soma,
			 '0' when Check;
	
			s2_comp1 <= '0' when Ligar,
					'1' when setnext,
					'0' when cont,
					'0' when soma,
						  '0' when Check;
	
			clr_Cont_local <= '1' when Check,
					  '1' when Ligar,
					  '1' when Display_val_soma;
					'1' when Gravar;
	
			clr_REGS_REP <=  '1' when Ligar;
			
			DISPLAY_EN <= '0' when Repouso,
						'1' when Ligar,
						'0' when desligar;
	
			en_CT_INAT <= '1' when Ligar;
			
			sl_comp1 <= '0' when Ligar,
					'1' when setnext,
					'0' when cont,
					'1' when soma,
						  '1' when Check;
			sl1_comp1 <= '0' when Ligar,
					'0' when setnext,
					'1' when cont,
					'1' when soma,
						  '0' when Check;
	
			sl2_comp1 <= '0' when Ligar,
					'0' when setnext,
					'0' when cont,
					'0' when soma,
						  '1' when Check;
	
			ld_REGS_REP_S <='0' when Ligar,
					'1' when setPonteiro;
	
			flag_next <= '0' when Repouso, 
					  '1' when setnext,
					  '0' when desligar,
				 '0' when resetar;
	
			Flag_rep_sq <= '0' when Repouso,
					'1' when Produzir_SQ;
	
			Flag_rep_s <= '0' when Repouso,
						'1' when Produzir_S;
	
			clr_CT_INAT <= '1' when e_back,
						 '1' when Produzir_SQ
								'1' when cont,
						 '1' when Repouso,
					'1' when Produzir_S,
					'1' when e_next;
	
			F_led <= '1' when Cheio,
				'0' when resetar;
	
			M_led <= '1' when Check,
				 '0' when resetar;
	
			en_CT_Msg <= '1' when Check;
	
			en <= '0' when Check,
					'1' when addr;
	
			p_p <= '0' when addr,
								 '1' when soma;
	
			r_w <= R_led when addr;
	
			ld_addr <= '1' when addr;
	
			en_CT_ON <= '1' when cont;
			
			erase_MEM <= '1' when resetar;
	
			
	
						
			
	
			
	
	end logica ;