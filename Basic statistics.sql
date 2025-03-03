/*Checking essential statistics */

Select min(concrete_strength) as min_strength, (max(concrete_strength) as max_strength,(avg(concrete_strength) as avg_strength,
Stddev(concrete_strength) as std_strength
FROM concrete_comprehensive


/*Looking for missing data*/
Select count(*) as total_rows,
	Sum(case when Cement is null then 1 else 0 end) as missing_cement,
	Sum(case when blast_furnance_slag is null then 1 else 0 end) as missing_Blast_Furnance_Slag,
	Sum(case when fly_ash is null then 1 else 0 end) as missing_fly_ash,
	Sum(case when water is null then 1 else 0 end) as missing_water,
	Sum(case when superplasticizer is null then 1 else 0 end) as missing_superplasticizer,
	Sum(case when coarse_aggregate is null then 1 else 0 end) as missing_coarse_aggregate,
	Sum(case when fine_aggregate is null then 1 else 0 end) as missing_fine_aggregate,
	Sum(case when age_day is null then 1 else 0 end) as missing_age_day,
	Sum(case when concrete_strength is null then 1 else 0 end) as concrete_strength
from concrete_comprehensive


/*checking the dependency between age_day and concrete strength*/
Select age_day,avg(concrete_strength)
from concrete_comprehensive
group by age_day
order by age_day

