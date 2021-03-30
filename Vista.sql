USE Hotel;

--
-- V I S T A S

--
-- Criacao da vista "vwEMailClientes"
CREATE VIEW vwMelhoresClientes AS
	SELECT 
    C.Id AS id, 
    C.nome AS Nome,
    COUNT(R.Codigo) AS Reserva,
    SUM(re.preco) AS TotalPago
    FROM cliente AS C 
        INNER JOIN reserva AS R
        ON C.id = R.Cliente_Id
            INNER JOIN reservaquarto AS re
            ON R.Codigo = re.Reserva_Codigo
    GROUP BY C.id
    ORDER BY TotalPago DESC
    LIMIT 5;

-- Utilização da vista criada anteriormente
SELECT *
	FROM vwMelhoresClientes;

-- Remoção da vista criada.
DROP VIEW vwMelhoresClientes;

--
-- Criacao da vista "vwReservasCanceladas" onde o resultado é uma lista de reservas canceladas
CREATE VIEW vwReservasCanceladas AS
	SELECT R.Codigo 'Codigo Reserva', C.Id, C.nome 'Nome', R.DataCheckIn, R.DataCheckOut
		FROM reserva AS R INNER JOIN cliente AS C
			ON R.Cliente_Id = C.Id
			WHERE R.Observacoes LIKE 'Cancelada';
            
-- Utilização da vista criada anteriormente.
SELECT *
	FROM vwReservasCanceladas;

-- Remoção da vista "vwReservasCanceladas".
DROP VIEW vwReservasCanceladas;            
            
-- <fim>
--

