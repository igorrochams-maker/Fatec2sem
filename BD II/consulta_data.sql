
select getdate()

select datename(YY,GETDATE())
select datename(MONTH,GETDATE()) -- Mês extenso
select datename(HOUR,GETDATE())
select datename(minute,GETDATE())
select datename(second,GETDATE())

select datepart(MM,getdate()) -- Mês numérico

-- Getdate pode ser trocado por alguma coluna

select day (getdate())
select month (getdate())
select year (getdate())

-- Diferença entre datas

select datediff (yy, '05-05-2007', getdate())
select datediff (mm, '05-05-2007', getdate())
select datediff (mm, '30-04-2007', getdate())
select datediff (day, '05-05-2007', getdate())
select datediff (day, '30-04-2007', getdate())
select datediff (yy, '18-08-1912', getdate())
select datediff (mm, '18-08-1912', getdate())
select datediff (dd, '18-08-1912', getdate())
select datediff (hour, '18-08-1912', getdate())
select datediff (hour, '05-05-2007', getdate())

-- adiciona a parte de uma data. Retrorna um novo valor datetime especificado no datepart

select dateadd(yy,1,getdate())


-- Detecta se a data é valida

select isdate('27-02-2023')
select isdate('30-02-2023')

-- Formatação de data, último código responsável por buscar a formatação no dicionário da microsoft

SELECT CONVERT(CHAR,GETDATE(),103)
SELECT CONVERT(CHAR,GETDATE(),113)








