
-- 1.Does a school system(specifically international, assembly, or community) depend on how well students do on their sat?

SELECT * FROM sat.scores;
select
  case 
    when s.school_name like '%international%' then 'international'
    when s.school_name like '%assembly%' then 'assembly'
    when s.school_name like '%community%' then 'community'
    when s.school_name like '%academy%' then 'academy'
    when s.school_name like '%institute%' then 'institute'
    else 'other'
  end as school_type,
  count(*) as num_schools,
  sum(s.number_of_test_takers) as total_students,
  min(s.number_of_test_takers) as min_students,
  max(s.number_of_test_takers) as max_students,
  round(sum((s.reading_mean + s.math_mean + s.writing_mean)*s.number_of_test_takers)/sum(s.number_of_test_takers)) as avg_score,
  round(stddev(s.reading_mean + s.math_mean + s.writing_mean)) as sdev_mean_score,
  round(avg(s.reading_mean + s.math_mean + s.writing_mean)) as avg_mean_score
  -- s.*
from scores s
group by school_type
-- having school_type != 'unknown'
order by avg_score desc
;

select
  case 
    when s.school_name like '%international%' then 'international'
    when s.school_name like '%assembly%' then 'assembly'
    when s.school_name like '%community%' then 'community'
    else 'unknown'
  end as school_type,
  
  s.*
from scores s
having school_type != 'unknown'

;

select
  count(*) as num_schools,
  sum(s.number_of_test_takers) as total_students,
  min(s.number_of_test_takers) as min_students,
  max(s.number_of_test_takers) as max_students,
  round(sum((s.reading_mean + s.math_mean + s.writing_mean)*s.number_of_test_takers)/sum(s.number_of_test_takers)) as avg_score,
  round(stddev(s.reading_mean + s.math_mean + s.writing_mean)) as sdev_mean_score,
  round(avg(s.reading_mean + s.math_mean + s.writing_mean)) as avg_mean_score
  -- s.*
from scores s
-- group by school_type
-- having school_type != 'unknown'
-- order by avg_score desc
;