use "/Users/simranpalak/Desktop/EC481 Data/Replication_package_Economic_consequences_sleep/Replication_package_Economic_consequences_sleep/Datasets/firststage_dataset.dta", clear


cap drop sleep_all
gen sleep_all= sleep_time
replace sleep_all = Sleep_Night if pid == 5591 
replace sleep_all = Sleep_Night + nap_hr if pid == 5130 & day_in_study == 27 

	gen treat_int = treat_pool*treat_nap 
	gen treat_int_s = treat_s*treat_nap
	gen treat_int_s_i = treat_s_i*treat_nap
	
	gen treat_pool_cell = treat_pool*(1-treat_nap)
	gen treat_s_cell = treat_s*(1-treat_nap)
	gen treat_s_i_cell = treat_s_i*(1-treat_nap)
	gen treat_np_cell = treat_nap*(1-treat_pool)
	gen treat_int_cell = treat_int 
	gen treat_int_s_cell = treat_int_s
	gen treat_int_s_i_cell = treat_int_s_i
	

			local controls "i.quart_age Female"

			capture drop _baseline baseline
			gen _baseline			= Sleep_Night if post_treatment==0 
			egen baseline 	= mean(_baseline), by(pid)
			
			reghdfe Sleep_Night `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 1, cluster(pid) absorb(date day_in_study)
			
	
			
			capture drop _baseline baseline
			gen _baseline			= act_inbed if post_treatment==0
			egen baseline 	= mean(_baseline), by(pid)
					
			reghdfe act_inbed `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 1, cluster(pid) absorb(date day_in_study)

		
		replace sleep_eff = sleep_eff*100
			
				capture drop _baseline baseline
				gen _baseline			= sleep_eff if post_treatment==0
				egen baseline 	= mean(_baseline), by(pid)
					
			reghdfe sleep_eff `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment == 1 & Female == 1, cluster(pid) absorb(date day_in_study)

			
		
		local controls "i.quart_age Female"
					
			reghdfe nap_hr `treatments' `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 1, cluster(pid) absorb(date day_in_study)
			


			local controls "i.quart_age Female"

			capture drop _baseline baseline
			gen _baseline			= Sleep_Night if post_treatment==0 
			egen baseline 	= mean(_baseline), by(pid)
			
			reghdfe Sleep_Night `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 0, cluster(pid) absorb(date day_in_study)	

	
		capture drop _baseline baseline
			gen _baseline			= act_inbed if post_treatment==0
			egen baseline 	= mean(_baseline), by(pid)
					
			reghdfe act_inbed `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 0, cluster(pid) absorb(date day_in_study)

			
		
		replace sleep_eff = sleep_eff*100
			
				capture drop _baseline baseline
				gen _baseline			= sleep_eff if post_treatment==0
				egen baseline 	= mean(_baseline), by(pid)
					
			reghdfe sleep_eff `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment == 1 & Female == 0, cluster(pid) absorb(date day_in_study)
		


		local controls "i.quart_age Female"
					
			reghdfe nap_hr `treatments' `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if post_treatment==1 & Female == 0, cluster(pid) absorb(date day_in_study)
			

		local controls "i.quart_age female"
		capture drop _baseline baseline
		gen _baseline			= ds_a32_happiness if post_treatment==0
		egen baseline 	= mean(_baseline), by(pid)
			
reghdfe ds_a32_happiness `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if female==1, cluster(pid) absorb(date day_in_study)



		local controls "i.quart_age female"
		capture drop _baseline baseline
		gen _baseline			= ds_a32_happiness if post_treatment==0
		egen baseline 	= mean(_baseline), by(pid)
			
reghdfe ds_a32_happiness `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if female==0, cluster(pid) absorb(date day_in_study)




		local controls "i.quart_age female"
		capture drop _baseline baseline
		gen _baseline			= earnings if post_treatment==0
		egen baseline 	= mean(_baseline), by(pid)
			
reghdfe earnings `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if female==1, cluster(pid) absorb(date day_in_study)


		local controls "i.quart_age female"
		capture drop _baseline baseline
		gen _baseline			= earnings if post_treatment==0
		egen baseline 	= mean(_baseline), by(pid)
			
reghdfe earnings `treatments' baseline `controls' treat_s_cell treat_s_i_cell treat_np_cell treat_int_s_cell treat_int_s_i_cell if female==0, cluster(pid) absorb(date day_in_study)
