CREATE PROCEDURE spQuestao01
@CodCliente int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM Clientes WHERE CodCliente = @CodCliente AND Salario < 900)
	BEGIN
		UPDATE Clientes SET LimiteCredito = LimiteCredito + (LimiteCredito * 0.05)
		WHERE CodCliente = @CodCliente;
	END
	ELSE
	BEGIN
		UPDATE Clientes SET LimiteCredito = LimiteCredito + (LimiteCredito * 0.10)
		WHERE CodCliente = @CodCliente;
	END
END
GO

CREATE PROCEDURE spQuestao02
@CodProduto int,
@PercentualDesconto int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Produtos SET
		PrecoProduto = PrecoProduto - ((PrecoProduto * @PercentualDesconto)/100)
	WHERE CodProduto = @CodProduto;
END
GO

CREATE PROCEDURE spQuestao03
@NomeCliente varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Clientes
	WHERE NomeCliente = @NomeCliente
END
GO

CREATE PROCEDURE spQuestao04
@NomeCliente varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Produtos
	WHERE QuantidadeEstoque = 0
	ORDER BY DescricaoProduto;
END