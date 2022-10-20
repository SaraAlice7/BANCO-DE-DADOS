CREATE TRIGGER tiItens ON Itens
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;

DECLARE @CodVendas int, @Quantidade int, @ValorUnitario money;

SELECT
@CodVendas = CodVenda,
@Quantidade = Quantidade,
@ValorUnitario = ValorUnitario
FROM inserted

UPDATE Vendas SET ValorTotal = 4.00
WHERE CodVenda = 1

END