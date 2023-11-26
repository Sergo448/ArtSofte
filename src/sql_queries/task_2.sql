/* TASK 2 */
 
/* Создаем отдельную таблицу для удобстава написания дальнейгего скрипта */ 
with temp_t(value, manager_email) as 
(
select 
	SUM(p.value)
	/* Приводим к 1 виду */
	, substring(p.manager_email, 1, 1)||'.'||substring(p.manager_email, 2)
	from payments as p
		group by p.manager_email 
)

/* Создаем результирующую таблицу */
select 
	/* Решаем кейс с "отдел не определен" */
	case 
		when md.department isnull then 'отдел не определен'
		else md.department 
		end
	, SUM(tt.value)
	from temp_t as tt join manager_departments as md on tt.manager_email = md.email 
		group by md.department 