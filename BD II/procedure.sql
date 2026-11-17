use SUBCONSULTA;

CREATE PROCEDURE CalcularValorTotalPedido
	@PedidoID INT
AS
BEGIN
	SELECT ValorTotal = SUM(Preco)
	FROM Produto
	WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido
						WHERE PedidoID = @PedidoID)
END