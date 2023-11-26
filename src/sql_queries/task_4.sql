/* TASK 4 */

/* Итоговый SELECT */ 
select 
	t.year, t.month, t.revenue_by_month,
	SUM(t.revenue_by_month) over (order by t.year, t.MONTH) as revenue_cumsum
 from 
 
  /* Внутренний селект с суммой по месяцам */
 	(
 	select 
 	  	  SUM(p.value) as revenue_by_month
		, date_part('year', p.payment_date) as YEAR
		, date_part('month', p.payment_date) as MONTH
	 from payments as p 
	 	group by date_part('year', p.payment_date), date_part('month', p.payment_date) 
	 		order by date_part('year', p.payment_date) asc , date_part('month', p.payment_date) asc 
 	)
as t