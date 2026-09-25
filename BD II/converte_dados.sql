-- Utilizado para arredondar um número
-- ROUND( nueric_expression, length)

select ROUND(123.3467, 3)
select ROUND(123.3467, 2)
select ROUND(123.3467, 1)
select ROUND(123.5467, 1)
select ROUND(123.3467, 0)
select ROUND(123.3467, -1)
select ROUND(123.3467, -2)

--  Retorna o maior inteiro menor ou igual à expressão numérica especificada
--  FLOOR ( numeric_expression )

 SELECT FLOOR(123.45)

-- Calcula a potência
-- POWER(n,expoente)

select POWER(4,2)
select POWER(2,2)

-- Retorna o valor no modo ASCII do caracter mais a esquerda
-- ASCII(character_expression)

select ASCII('A'),ASCII('AMANDA')

-- Convert um código ASCII em um Caractere
-- CHAR(int)

select char(65), char(66)

-- Pesquise expression2 pela expression1 e retorna sua posição inicial se for localizada. A pesquisa inici em posição inicial
-- CHARINDEX(expression1, expression2, posição inicial

select charindex('mundo', 'olá mundo bonito')
select charindex('mundo', 'olá mundo bonito', 3)
select charindex('mundo', 'olá mundo bonito', 6)

-- Substitui pedaços de uma string

select REPLACE('abcedefghicde','cde','xxx')
select REPLACE(PRIMEIRO_NOME,'C','Z') FROM FUNCIONARIO

-- Insere uma cadeia de caractere em outra cadeia
-- STUFF (Expressão Início , Quantidade de caracteres que serão trocados, Conjunto de caracteres que irão substituir)

select STUFF('abcdef',2,3,'_ijklmn_')

-- Retorna a parte esquerda de uma cadeia de caracteres
-- LEFT(character_expression, quantidade de letras)

select LEFT('abcdefgh', 5)

-- Retorna a parte direita de uma cadeia de caracteres
-- RIGHT(character_expression, quantidade de letras)

select RIGHT('abcdefgh', 5)

-- Repete um valor da cadeia de caracteres
-- REPLICATE(string_expression, quantity)

select REPLICATE('ABC',3)

-- Retorna parte de uma expressão de caractere.
-- SUBSTRING(value_expression, start_exprssion, length_expression)

select SUBSTRING('ABCDEFGHIJ',2,3)

-- Retorna o número de caracteres da expressão da cadeia de caracteres especificadas, excluindo espaço em branco à direita
-- LEN(string_expression)

select LEN('ABCD')
select LEN('ABCD ')

-- Retorna uma expressão de caractere depois de converter para minúsculas
-- LOWER(character_expression)

select LOWER('abCd')

-- Retorna uma expressão de caractere depois de converter para Maiuscula 
-- UPPER(character_expression)

select UPPER('abCd ')

-- Retorna uma expressão depois de remover espaços em branco à direita
-- LTRIM(Character_expression)

select '_' + LTRIM('AbCD ') + '_'

-- Retorna uma expressão depois de remover espaços em branco à esquerda
-- RTRIM(Character_expression)

select '_' + RTRIM('AbCD ') + '_'
