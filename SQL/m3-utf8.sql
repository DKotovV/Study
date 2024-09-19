--=============== МОДУЛЬ 3. ОСНОВЫ SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите для каждого покупателя его адрес проживания, 
--город и страну проживания.

select CONCAT(first_name, ' ', last_name) as customer_name, a.address, ct.city, cr.country 
from customer c
left join address a on  c.address_id = a.address_id
left join city ct on a.city_id = ct.city_id
left join country cr on ct.country_id = cr.country_id  


--ЗАДАНИЕ №2
--С помощью SQL-запроса посчитайте для каждого магазина количество его покупателей.

select store_id "ID магазина", count(distinct(customer_id)) "Количество покупателей"
from customer c
group by store_id



--Доработайте запрос и выведите только те магазины, 
--у которых количество покупателей больше 300-от.
--Для решения используйте фильтрацию по сгруппированным строкам 
--с использованием функции агрегации.

select store_id "ID магазина", count(distinct(customer_id)) "Количество покупателей"
from customer c
group by store_id
having count(distinct(customer_id)) > '300'



-- Доработайте запрос, добавив в него информацию о городе магазина, 
--а также фамилию и имя продавца, который работает в этом магазине.


select st.store_id "ID магазина", c.ct "Количество покупателей",
c2.city "Город", concat(s.first_name, ' ', s.last_name) "Имя сотрудника"
from store st
left join address a on st.address_id = a.address_id
left join city c2 on a.city_id  = c2.city_id
left join staff s on st.store_id = s.store_id
left join (
select store_id "ID магазина", count(distinct(customer_id)) ct
from customer
group by store_id
having count(distinct(customer_id)) > '300'
) as c on st.store_id = c."ID магазина"
where c.ct is not null


--ЗАДАНИЕ №3
--Выведите ТОП-5 покупателей, 
--которые взяли в аренду за всё время наибольшее количество фильмов


<<<<<<< HEAD

=======
select concat(first_name, ' ', last_name) "Фамилия и имя покупателя", count(payment_id) "Количество фильмов"
from payment p
left join customer c on p.customer_id = c.customer_id 
group by c.customer_id
order by 2 desc
limit 5
>>>>>>> ca1b1b62bffc83f1eb0084f21dcfd9b430c67ff7


--ЗАДАНИЕ №4
--Посчитайте для каждого покупателя 4 аналитических показателя:
--  1. количество фильмов, которые он взял в аренду
--  2. общую стоимость платежей за аренду всех фильмов (значение округлите до целого числа)
--  3. минимальное значение платежа за аренду фильма
--  4. максимальное значение платежа за аренду фильма

<<<<<<< HEAD

=======
select concat(last_name, ' ', first_name) "Фамилия и имя покупателя",
count(payment_id) "Количество фильмов",
round(sum(amount)) "Общая стоимость платежей",
min(amount) "Минимальная стоимость платежа",
max(amount) "Максимальная стоимость платежа"
from payment p
left join customer c on p.customer_id = c.customer_id 
group by 1
>>>>>>> ca1b1b62bffc83f1eb0084f21dcfd9b430c67ff7



--ЗАДАНИЕ №5
--Используя данные из таблицы городов, составьте все возможные пары городов так, чтобы 
--в результате не было пар с одинаковыми названиями городов. Решение должно быть через Декартово произведение.
 
<<<<<<< HEAD


=======
-- Если я понял правильно, то так:

SELECT a.city AS city1, b.city AS city2
FROM city a
CROSS JOIN city b
WHERE a.city_id <> b.city_id and a.city_id < b.city_id
>>>>>>> ca1b1b62bffc83f1eb0084f21dcfd9b430c67ff7


--ЗАДАНИЕ №6
--Используя данные из таблицы rental о дате выдачи фильма в аренду (поле rental_date) и 
--дате возврата (поле return_date), вычислите для каждого покупателя среднее количество 
--дней, за которые он возвращает фильмы. В результате должны быть дробные значения, а не интервал.
 
<<<<<<< HEAD

=======
select customer_id "ID покупателя",
round(avg(extract(epoch from (return_date - rental_date)) / 86400.0), 2) "Среднее количество дней на возврат"
from rental r 
group by customer_id
order by customer_id
>>>>>>> ca1b1b62bffc83f1eb0084f21dcfd9b430c67ff7



--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Посчитайте для каждого фильма сколько раз его брали в аренду и значение общей стоимости аренды фильма за всё время.





--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания и выведите с помощью него фильмы, которые отсутствуют на dvd дисках.





--ЗАДАНИЕ №3
--Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку "Премия".
--Если количество продаж превышает 7300, то значение в колонке будет "Да", иначе должно быть значение "Нет".







