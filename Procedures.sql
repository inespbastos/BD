USE Hotel;

-- Consulta de todo o conteúdo da tabela "cliente".
SELECT *
	FROM cliente;

-- Consulta de todo o conteúdo da tabela "contacto".
SELECT *
	FROM contacto;

-- Consulta de todo o conteúdo da tabela "endereco".
SELECT *
	FROM endereco;
    
-- Consulta de todo o conteúdo da tabela "quarto".
SELECT *
	FROM quarto;
    
-- Consulta de todo o conteúdo da tabela "reserva".
SELECT *
	FROM reserva;
    
-- Consulta de todo o conteúdo da tabela "reservaquarto".
SELECT *
	FROM reservaquarto;
    
-- Consulta de todo o conteúdo da tabela "reservaservico".
SELECT *
	FROM reservaservico;
    
-- Consulta de todo o conteúdo da tabela "servico".
SELECT *
	FROM servico;
    
-- Consulta de todo o conteúdo da tabela "Cliente".
SELECT *
	FROM tipodecliente;
    
-- Consulta de todo o conteúdo da tabela "Cliente".
SELECT *
	FROM tipodequarto;


 --
 -- Por quem o melhor quarto do hotel foi utilizado
 SELECT R.Codigo 'Codigo Reserva', C.Id 'ID Cliente' ,C.nome AS Nome
	FROM cliente AS C INNER JOIN reserva AS R
		ON C.Id=R.Cliente_Id
		 INNER JOIN reservaquarto AS RQ
			ON R.Codigo = RQ.Reserva_Codigo
			WHERE  RQ.Quarto_Numero1=62;

 --
 -- Por quem foi utilizado o quarto com otima vista para a Universidade do Minho
 SELECT R.Codigo 'Codigo Reserva', C.Id 'ID Cliente' ,C.nome AS Nome
	FROM cliente AS C INNER JOIN reserva AS R
		ON C.Id=R.Cliente_Id
		 INNER JOIN reservaquarto AS RQ
			ON R.Codigo = RQ.Reserva_Codigo
			WHERE  RQ.Quarto_Numero1=43;
--
-- Mostra os serviços nunca utilizados
SELECT servico.codigo AS Codigo, servico.descricao AS Descricao
	FROM servico INNER JOIN reservaservico
	WHERE servico.codigo NOT IN (SELECT reservaservico.servico_codigo_servico FROM reservaservico)
	GROUP BY servico.codigo;

--
-- P R O C E D I M E N T O S
-- Criacao de um procedimento para nos indicar os Clientes que reservaram 
-- numa Data.

DELIMITER $$
CREATE PROCEDURE spReservasPorAnoMes
  (IN Mes INT, IN Ano INT)
BEGIN
	SELECT C.Id, C.nome, RE.DataCheckIn
	FROM reserva AS RE INNER JOIN cliente AS C
		ON RE.Cliente_Id = C.Id
	WHERE 
		MONTH(RE.DataCheckIn) = Mes AND
        YEAR(RE.DataCheckIn) = Ano;
        
END $$

--
-- Execucao do procedimento "spReservasPorAnoMes".
CALL spReservasPorAnoMes(5,2020)

--
-- Remocao do procedimento "spReservasPorAnoMes" do sistema.
DROP PROCEDURE spReservasPorAnoMes;

--
-- Criacao de um procedimento para nos indicar os Clientes que reservaram
-- um determinado serviço
DELIMITER $$
CREATE PROCEDURE spTiposDeServicos
  (IN codServico INT)
BEGIN
	SELECT C.Id AS Id, C.nome AS nome, C.Idade AS Idade, 
	C.Profissao AS Profissao
	FROM cliente AS C INNER JOIN reserva AS R
		ON C.Id=R.Cliente_Id
        INNER JOIN reservaservico AS RS
			ON R.Codigo=RS.Reserva_Codigo
			INNER JOIN servico AS S
            ON RS.Servico_Codigo_Servico=S.Codigo
			WHERE S.Codigo = codServico;
END $$

-- Invocacao do procedimento "spTiposDeServicos".
CALL spTiposDeServicos(2)

-- Remocao do procedimento "spTiposDeServicos" do sistema.
DROP PROCEDURE spTiposDeServicos;

--
-- Criacao de um procedimento para nos indicar os tipos dos Clientes.
DELIMITER $$
CREATE PROCEDURE spTiposDeClientes
  (IN cod INT)
BEGIN
	SELECT C.Id AS Id, C.nome AS nome, C.Idade AS Idade, 
	C.Profissao AS Profissao, TC.Descricao AS TipoDeCliente
	FROM cliente AS C INNER JOIN tipodecliente AS TC
		ON C.TipoDeCliente_Codigo=TC.Codigo
	WHERE C.TipoDeCliente_Codigo = cod;

END $$

--
-- Execucao do procedimento "spTiposDeClientes".
CALL spTiposDeClientes(5)
--
-- Remocao do procedimento "spTiposDeClientes" do sistema.
DROP PROCEDURE spTiposDeClientes

--
-- Criacao de um procedimento para nos indicar o numero dos quartos reservados
-- numa Data.
DELIMITER $$
CREATE PROCEDURE spNumeroDeQuartosData 
  (IN Mes INT, IN Ano INT)
BEGIN
	SELECT C.Id, C.Nome, RE.DataCheckIn, rq.Quarto_Numero1 AS NumeroQuarto
	FROM reserva AS RE INNER JOIN cliente AS C
		ON RE.Cliente_Id = C.Id
        INNER JOIN reservaquarto AS rq
        ON re.Codigo = rq.Reserva_Codigo
	WHERE 
		MONTH(RE.DataCheckIn) = Mes AND
        YEAR(RE.DataCheckIn) = Ano
        GROUP BY NumeroQuarto;
        
END $$

--
-- Execucao do procedimento "spNumeroDeQuartosData".
CALL spNumeroDeQuartosData(5,2020);

--
-- Remocao do procedimento "spNumeroDeQuartosData" do sistema.
DROP PROCEDURE spNumeroDeQuartosData

--
-- Criacao de um procedimento para nos indicar a cidade e o nome do cliente
-- dado um pais.
DELIMITER $$
CREATE PROCEDURE spCidadeNome 
    (IN pais VARCHAR(100))
BEGIN
    SELECT E.Cidade AS Cidade, 
        C.nome AS NomeCliente
        FROM Cliente AS C INNER JOIN Endereco AS E
            ON C.id=E.Cliente_Id
            WHERE E.Pais = pais;
END $$

--
-- Execucao do procedimento "spCidadeNome".
CALL spCidadeNome ('Espanha');

--
-- Remocao do procedimento "spCidadeNome" do sistema.
DROP PROCEDURE spCidadeNome;

-- F U N C O E S
-- Criacao de uma função para nos indicar o que foi pago para um
-- dado cliente.
DELIMITER $$
CREATE FUNCTION fuPagoCliente
    (cliente1 VARCHAR(100))
    RETURNS VARCHAR(100)
    DETERMINISTIC
BEGIN
    DECLARE pagar VARCHAR(100); 
    SELECT SUM(re.preco) INTO pagar
    FROM cliente AS C 
        INNER JOIN reserva AS R
        ON C.id = R.Cliente_Id
            INNER JOIN reservaquarto AS re
            ON R.Codigo = re.Reserva_Codigo
            WHERE C.nome =cliente1;
           RETURN pagar;
END $$

-- Invocacao da funcao "fuPagoCliente".
SELECT fuPagoCliente('Diogo Pereira Catalao Da Costa');

-- Remocao da funcao "fuEMailCliente" do sistema.
DROP FUNCTION fuPagoCliente;



-- G A T I L H O S (Triggers).
-- Criação de uma funcao que indica o email de um cliente dado o seu número de cliente.

ALTER TABLE reserva
	ADD Observacoes VARCHAR(100) NULL;

ALTER TABLE reserva 
	DROP COLUMN Observacoes;

DESC reserva;

--
DROP PROCEDURE spCancelaReserva;

--
DELIMITER $$
CREATE PROCEDURE spCancelaReserva
	(IN NrReserva INT)
BEGIN
	UPDATE reserva
		SET Observacoes = 'Cancelada'
        WHERE Codigo = NrReserva;

END $$

--
CALL spCancelaReserva(111);