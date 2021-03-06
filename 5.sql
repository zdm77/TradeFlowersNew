SELECT Наименование, /*case
         when s [ 1 ] = 'R' then select a.real_name  from auction_prefix a
         when s [ 1 ] = 'TU' then 'Тульпан'
         when s [ 1 ] = 'CHR' then 'Хризантема'
       END as type1,*/
       (
         SELECT a.real_name
         from auction_prefix a
         where a.prefix_name = s [ 1 ]
         limit 1
       ) as type1,
       substring(Наименование, POSITION(s [ 3 ] IN Наименование)) as name
FROM (
       SELECT Наименование,
              regexp_split_to_array("Наименование", ' ') AS s
       FROM "аукцион"."Номенклатура"
     ) t