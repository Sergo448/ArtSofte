/* TASK 1*/

/* SELECT VARIABLES*/ 
select 
	
	 p.client_name
	, p.payment_date
	, p.value

	from payments as p
	
	/* RULES*/ 
	where 
		(date_part('year', p.payment_date) = 2023)
		and (date_part('month', p.payment_date) = 1)
		
		order by p.value desc
		
		limit 3;