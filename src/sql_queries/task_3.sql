/* TASK 3*/

select
*,
/* Работает с полем client_id */
 case 
	when COUNT(p.client_id) over (partition by p.client_id) > 1 then 'Новый'
	else 'Действующий'
	end client_state
	
	from payments as p;
	
