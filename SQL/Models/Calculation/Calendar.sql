create table calendar (
   my_date          date        not null
  ,year             smallint    not null
  ,month            smallint    not null
  ,month_name       char(3)     not null
  ,day_of_mon       smallint    not null
  ,day_of_week      varchar(9)  not null
  ,week_of_year     smallint    not null
  ,day_of_year      smallint    not null
)
as
  with date_generator as (
    select dateadd(day, seq4(), '2018-01-01') as cal_date
      from table(generator(rowcount=>2000))
  )
  select cal_date
        ,year(cal_date)
        ,month(cal_date)
        ,monthname(cal_date)
        ,day(cal_date)
        ,dayofweek(cal_date)
        ,weekofyear(cal_date)
        ,dayofyear(cal_date)
    from date_generator