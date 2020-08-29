-- 1) Crie uma calculadora que processa as quatro opera coes fundamentais (+ - * /)

-- essa calculadora deverá ser criada usando variáveis (numerador, denominador, total, tipo_operação)

-- Faça o tratamento de divisão por zero

declare @numerador money, 
		@denominador money, 
		@total money, 
		@tipo_operacao varchar(200),
		@resultado varchar(20)
		
set @numerador = 10
set @denominador = 11
set @tipo_operacao = 'soma'

IF (@tipo_operacao LIKE 'soma') BEGIN 
	begin try
	set @total = @numerador + @denominador
	end try
	begin catch
		select ERROR_MESSAGE() as Mensagem, ERROR_NUMBER()
		set @total = 0
	end catch

	select @total as TotalCalculo
END
ELSE IF (@tipo_operacao = 'subtracao') BEGIN
	begin try
	set @total = @numerador - @denominador
	end try
	begin catch
		select ERROR_MESSAGE() as Mensagem, ERROR_NUMBER()
		set @total = 0
	end catch

	select @total as TotalCalculo
END
ELSE IF (@tipo_operacao = 'divisao') and (@denominador != 0) BEGIN
	begin try
	set @total = @numerador / @denominador
	end try
	begin catch
		select ERROR_MESSAGE() as Mensagem, ERROR_NUMBER()
		set @total = 0
	end catch

	select @total as TotalCalculo
END
ELSE IF (@tipo_operacao = 'divisao') and (@denominador = 0) BEGIN
	set @resultado = 'infinito' 

	select @resultado as TotalCalculo
END
ELSE IF (@tipo_operacao = 'subtracao') BEGIN
	begin try
	set @total = @numerador - @denominador
	end try
	begin catch
		select ERROR_MESSAGE() as Mensagem, ERROR_NUMBER()
		set @total = 0
	end catch

	select @total as TotalCalculo
END
ELSE BEGIN
	set @resultado = 'erro' 

	select @resultado as TotalCalculo
END

-- 2) Escreva comando que faça um insert na tabela de FotografiasComentarios através de variáveis.

declare @i int = 1, 
		@tot int = 10,
		@id_foto int = 1,
		@id_conta int =1,
		@comentario varchar(200)

while @i <= @tot begin
	
	--insere
	set @comentario = '5 x ' + convert(varchar,(@i)) + ' = ' + convert(varchar,5*@i) 
	insert into comentario (id_fotografia, id_conta, comentario) values (@id_foto,@id_conta,@comentario)
	
	-- incrementando a vari�vel de controle
	set @i = @i + 1

end

-- 3) Escreva com suas palavras a diferença de Begin Tran, Rollback e Commit

-- Resposta
-- 
-- Begin é quando incia a conexão com o banco e,indica onde a transação de informações começa
-- 
-- Commit indidica o término de uma troca de informações, onde informações de inserção 
-- fazem parte do banco e são visiveis, um select depois de um commit é diferente de um select antes
--
-- Rollback Transaction Término de uma transação de dados, porem algo deu errado
-- e as alterações devem ser desfeitas
--

-- 4) Monte um exemplo em que você irá abrir uma transação, e depois finalizar com rollback e outro exemplo que você finaliza com o commit.


--Neste exemplo fazemos rollback caso tudo de errado e commit caso de tudo certo
-- no caso de o administrador do banco perceber que a média das pessoas estão colcando nomes 
-- muito grandes nos albuns de foto ele almenta o tamanho para 40
BEGIN TRANSACTION;
begin try
    declare @tam int
    set @tam = (select AVG(DATALENGTH(nome)) from socialNetwork.dbo.albuns)+8

    IF (@tam > 20) BEGIN 
        ALTER TABLE socialNetwork.dbo.albuns ALTER COLUMN nome varchar(40);
    END
        
end try
begin catch
    select ERROR_MESSAGE() as Mensagem, ERROR_NUMBER()
    ROLLBACK TRANSACTION 
end catch
COMMIT

    



