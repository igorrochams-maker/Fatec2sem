use SUBCONSULTA;


-- Atualização com erro
UPDATE Produto SET CategoriaID = 100 WHERE ProdutoID = 3;
IF @@ERROR = 0
COMMIT
ELSE
ROLLBACK; -- Detectou um erro, então desfaz as operações
PRINT 'Atualização na Tabela Produto foi Cancelada';

-- Case usado para criar coluna com comentários para categorizar o preço dos produtos
SELECT NomeProduto, Preco,
	CASE
		WHEN Preco < 100 THEN 'Barato'
		WHEN Preco >= 100 AND Preco < 1000 THEN 'Médio'
		ELSE 'Caro'
	END AS CategoriaPreco
FROM Produto
ORDER BY CategoriaPreco

-- Categoriza produtos antigos
SELECT PedidoID, DataPedido,
	CASE 
		WHEN DataPedido < '2023-06-01' THEN 'Antigo'
		ELSE 'Novo'
	END AS StatusPedido
FROM Pedido;

DECLARE @CategoriaDesejada INT = 1; -- Categoria Desejada
IF @CategoriaDesejada = 1
BEGIN
	INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
	VALUES (13, 'Tablet', @CategoriaDesejada, 1500);
END

DECLARE @CategoriaID INT = 1; -- Categoria desejada
DECLARE @NomeCategoria NVARCHAR(50);
IF EXISTS (SELECT * FROM Categoria WHERE CategoriaID = @CategoriaID)
BEGIN
	SELECT @NomeCategoria = NomeCategoria FROM Categoria WHERE CategoriaID = @CategoriaID;
	PRINT 'Nome da Categoria: ' + @NomeCategoria;
END
ELSE
BEGIN
	PRINT 'Categoria não encontrada';
END
