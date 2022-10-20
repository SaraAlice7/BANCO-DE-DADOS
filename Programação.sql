-- =============================================
-- Author:		Sara
-- Create date: 29-09-2022
-- Description:	Serve para cadastrar um novo correntista
-- =============================================
CREATE PROCEDURE spCorrentistasInserir 
	-- Add the parameters for the stored procedure here
	@NomeCorrentista varchar(50), 
	@Saldo money = 0
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CodigoCorrentista int;

    IF (@Saldo < 0)
	BEGIN
		RAISERROR ('O Saldo de abertura da conta não pode ser negativo.', 16, 1);
	END
	ELSE
	BEGIN
		INSERT INTO Correntistas(NomeCorrentista, Saldo, DataAberturaConta)
		VALUES (@NomeCorrentista, @Saldo, GETDATE());

		SET @CodigoCorrentista = SCOPE_IDENTITY();
	END

	RETURN(@CodigoCorrentista);
END
GO
