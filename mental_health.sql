create database mental_health_analysis;
use mental_health_analysis;

select * from mental_health;

-- number of male/female 
select count(Gender) from mental_health where gender='m';
select count(gender) from mental_health where gender='f';

-- age specified
select * from mental_health where age > '13';
select * from mental_health where age between '13' and '16';
select * from mental_health where age < '15';

-- average
select avg (sleep_hours) from mental_health;

-- sum
select sum(screen_time_hours) from mental_health;

-- group by clause
select count(academic_performance),gender from mental_health group by gender;
select count(age),academic_performance from mental_health group by academic_performance;

-- where
select count(gender),academic_performance from mental_health where gender='m' AND academic_performance='excellent';
select count(gender),academic_performance from mental_health where gender='f' and academic_performance='average';

-- having clause
select academic_performance, avg(survey_stress_score) as average_score from mental_health group by academic_performance having avg(survey_stress_score)>3;
select academic_performance, avg(survey_stress_score) as average_score from mental_health group by academic_performance having avg(survey_stress_score)<3;