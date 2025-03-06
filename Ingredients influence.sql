/* Checking correlation of given ingredients*/
Select CORR(cement,concrete_strength) as cement_corr,
		CORR(water,concrete_strength) as water_corr,
		CORR(fly_ash,concrete_strength) as fly_ash_corr
from concrete_comprehensive

/*Water influence*/
Select Water, AVG(concrete_strength) as average_conc_strength
from concrete_comprehensive
group by Water
order by average_conc_strength desc

/*Checking fly ash influence*/
Select Case WHEN fly_ash >0 THEN 'With Fly Ash' Else 'No Fly Ash' END AS fly_ash_group,avg(concrete_strength) as average_strength
from concrete_comprehensive
group by fly_ash_group

/*Finding best 10 proportions */
Select cement, fly_ash,water, age_day, concrete_strength
from concrete_comprehensive
order by concrete_strength
Limit 10

