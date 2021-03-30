--  
-- Implementação e Exploração de Sistemas de Bases de Dados Relacionais
-- O caso de Estudo do "Hotel D'UMinho"
-- Povoamento da Base de Dados Relacional                                                                                                                            
--                                                                                               
-- Obs.: Todos os objetos e elementos de dados manipulados pelos scripts SQL 
-- apresentados neste ficheiro são fictícios, tendo sido criados com o único 
-- objetivo de suportar a demonstração dos diversos tópicos e 
-- exercícios apresentadas e analisados nas aulas de bases de dados.
--

-- Indicação do esquema da base de dados de trabalho.
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
USE `hotel` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;



-- Povoamento da Tabela `hotel`.`TipoDeCliente`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`TipoDeCliente`;
-- SELECT * FROM `hotel`.`TipoDeCliente`;
INSERT INTO `hotel`.`TipoDeCliente` 
	(Codigo,Descricao)
VALUES
	('1','Estudante atual da Universidade'),
	('2','Estudante de erasmus'),
	('3','Futuro estudante na universidade'),
    ('4','Atividade lúdica na universidade'),
	('5','Pais de alunos');
    
    

-- Povoamento da Tabela `hotel`.`Cliente`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`Cliente`;
-- SELECT * FROM `hotel`.`Cliente`;

INSERT INTO Cliente
	(Id,Nome,Idade,Endereco,NIF,Profissao, TipoDeCliente_Codigo)
VALUES
	('1', 'António Oliveira e Castro','53','1','999321678','Empresário','5'),   
	('2', 'Paula Maria da Silva Antunes','38','2','893475978','Professora', '4'),  
	('3', 'Grethel Pagny Tourret','34','3','736497283','Engenheira de Polímeros', '4'),   
	('4', 'Rocío Garcia Camacha','21','4','937482903','Estudante', '1'),   
	('5', 'Diogo Pereira Catalão da Costa','28','5','837462836','Veterinário', '3'),   
	('6', 'Matteo Pietro Dybala','24','6','354723947','Estudante','2'), 
    ('7', 'José João Marques Gouveia','28','7','673549074','Médico', '4'),  
	('8', 'Zacarias Alfredo Monteiro', '31', '8', '673298467','Professor', '4'),
    ('9', 'Graziela Pietra Antonella', '24', '9', '746352839','Estudante', '2'),
    ('10', 'Diego Murilo', '45', '10', '373649278','Professor', '4'),
    ('11', 'Caroline Anita Fisz', '24', '11', '837263740', 'Estudante', '2'),
    ('12', 'Antonio Jose da Costa Afonseca','62', '12','198747389','Militar', '5' ),
    ('13', 'Anabela da Silva Sousa', '58', '13','284736256', 'Empresaria', '5'),
    ('14', 'Ricardo Joao Monteiro Abelheira', '35', '14','182736483','Engenheiro Informatico', '4'),
    ('15', 'Maria Beatriz Almeida DEca', '19','15','183746287', 'Estudante', '1'),
    ('16', 'Alessandro Enrico Dante', '23', '16','873746183','Estudante', '2'),
    ('17', 'Alessio Cunha Batina', '55', '17','986734872','Eletricista', '5' ),
    ('18', 'Teresa Seco', '22', '18','897423748','Estudante', '2'),
    ('19', 'Luis Faria Macedo','65','19','764326738','Dentista', '5'),
    ('20', 'Marta Côncio', '22','20', '378624763','Estudante', '3'),
    ('21', 'Roberto Cavalli', '46','21', '349283756','Contabilista', '4'),
    ('22', 'Javi Puertes', '17', '22','876473928','Estudante', '3'),
    ('23', 'Constanca Cunha', '18', '23','897764637', 'Estudante', '1'),
    ('24', 'Goncalo Ribeiro', '35', '24','786439287', 'Escritor', '4'),
    ('25', 'Alvarez de Lucas', '18', '25', '875374892','Estudante', '3'),
    ('26', 'Jorge Vieira', '54', '26', '876435748', 'Tecnico', '5'),
    ('27', 'Elvira Loureiro', '57', '27', '874928378', 'Gestora', '5'),
    ('28', 'Gervasio Gomes', '42', '28', '463748963', 'Professor', '4'),
    ('29', 'Roberto Carlos', '35', '29', '398756382', 'Engenheiro de Telecomunicoes', '4'),
    ('30', 'Rodrigo Araujo Pereira', '18', '30','783946102','Estudante', '1');
    
    

-- DELETE FROM `hotel`.`Endereco`;
-- SELECT * FROM `hotel`.`Endereco`;


INSERT INTO Endereco
	(Cliente_id,Cidade,Pais,Rua)
VALUES
	('1', 'Porto', 'Portugal', 'Rua da Juventude'),
    ('2', 'Lisboa', 'Portugal', 'Rua dos Pássaros'),
    ('3', 'Paris', 'França', 'Rue de La Vie'),
    ('4', 'Madrid', 'Espanha', 'Plaza del Real'),
    ('5', 'Beja','Portugal', 'Avenida da Felicidade'),
    ('6', 'Barcelona', 'Espanha', 'Plaza del Cariño'),
    ('7', 'Viana do Castelo', 'Portugal', 'Rua do Zé da Esquina'),
    ('8', 'Guarda', 'Portugal', 'Rua Do Monte de Baixo'),
    ('9', 'Florenca', 'Italia', 'Strada di Mozzarela'),
    ('10', 'Paris', 'França', 'Rue Croissant'),
    ('11', 'Rio de Janeiro', 'Brasil', 'Rua de Dezembro'),
    ('12', 'Coimbra', 'Portugal', 'Avenida da Boavista'),
    ('13', 'Guimaraes', 'Portugal', 'Rua Juvenil'),
    ('14', 'Aveiro', 'Portugal', 'Rua de Veneza'),
    ('15', 'Braga', 'Portugal', 'Rua da Boanova'),
    ('16', 'Milao', 'Italia', 'Strada di Buongiorno'),
    ('17', 'Sevilha', 'Espanha', 'Calle del Bailado'),
    ('18', 'Granada', 'Espanha', 'Calle del Hombre'),
    ('19', 'Braga', 'Portugal', 'Rua Feliz'),
    ('20', 'Funchal', 'Portugal', 'Rua das Almas'),
    ('21', 'Veneza', 'Italia', 'Piazza di Spaghetti'),
    ('22', 'Madrid', 'Espanha', 'Plaza del Puto Amo'),
    ('23', 'Braga', 'Portugal', 'Avenida da Foz'),
    ('24', 'Braga', 'Portugal', 'Rua das Cores'),
    ('25', 'Barcelona', 'Espanha', 'Plaza del Tigre'),
    ('26', 'Porto', 'Portugal', 'Rua do Compromisso'),
    ('27', 'Sintra', 'Portugal', 'Rua Daqui'),
    ('28', 'Braga', 'Portugal', 'Rua Feliz'),
    ('29', 'Zaragoza', 'Espanha', 'Plaza del Pilar'),
    ('30', 'Porto', 'Portugal', 'Praça da Misericordia');
    
    
    
-- Povoamento da Tabela `hotel`.`Contacto`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`Cliente`;
-- SELECT * FROM `hotel`.`Contacto`; 

INSERT INTO `hotel`.`Contacto` 
	(Cliente_Id, Email, Telefone )
VALUES
	('1','antonio@gmail.com','953647382'),
	('2','paula@gmail.com','915638462'),
	('3','tourretgrethel@gmail.com','467283946'),
	('4','rocio@gmail.com','874635270'),
	('5','dioguinhoc37@gmail.com','946730274'),
	('6','matteo@hotmail.com','678354673'),
	('7','jjgouveia@gmail.com', '926492856'),
    ('8', 'zaca@gmail.com', '983748392'),
    ('9', 'antonella@hotmail.com', '637482936'),
    ('10', 'diego@gmail.com', '876337483'),
    ('11', 'anita253@hotmail.com', '273526389'),
    ('12', 'ajc@outlook.com','624637285' ),
    ('13', 'anabela.sousa@gmail.com', '588782934'),
    ('14', 'ricas@gmail.com', '358758494'),
    ('15', 'mariazinha@hotmail.com', '198748491'),
    ('16', 'alessandro@gmail.com', '897348392'),
    ('17', 'alessiobatina@hotmail.com', '558973485' ),
    ('18', 'teresaseco@gmail.com', '229872543'),
    ('19', 'luis@gmail.com','659487554'),
    ('20', 'martinha@outlook@gmail.com', '227382943'),
    ('21', 'robertinho@gmail.com', '46738494'),
    ('22', 'javi@gmail.com', '1772839483'),
    ('23', 'constanca@hotmail.com', '188374931'),
    ('24', 'goncaloribeiro@gmail.com', '357392834'),
    ('25', 'alvarez@hotmail.com', '189883933'),
    ('26', 'jorginho@outlook.com', '548973543'),
    ('27', 'elvira@gmail.com', '578374835'),
    ('28', 'gervasio@gmail.com', '423847392'),
    ('29', 'robertocarlos@outlook.com', '358493844'),
    ('30', 'rodri@gmail.com', '188984914');
    


-- Povoamento da Tabela `hotel`.`TipoDeQuarto`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`TipoDeQuarto`; 
-- SELECT * FROM `hotel`.`TipoDeQuarto`; 
INSERT INTO `hotel`.`TipoDeQuarto` 
	(Codigo,Valor,Descricao)
VALUES
	('1', '25', 'Quarto Simples Standard'),
	('2', '45', 'Quarto Duplo Standard'),
    ('3', '65', 'Quarto Triplo Standard'),
    ('4', '95', 'Quarto Quadruplo Standard'),
    ('5', '120', 'Quarto Suite Standard'),
    ('6', '50', 'Quarto Simples Deluxe'),
    ('7', '65', 'Quarto Duplo Deluxe'),
    ('8', '80', 'Quarto Triplo Deluxe'),
    ('9', '100', 'Quarto Quadruplo Deluxe'),
    ('10', '132', 'Quarto Suite Deluxe');
    
    
    


-- Povoamento da Tabela `hotel`.`Quarto`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`Quarto`;
-- SELECT * FROM `hotel`.`Quarto`;
INSERT INTO `hotel`.`Quarto`
	(Numero,Andar,Ocupacao_Maxima,TipoDeQuarto_Codigo,Descricao)
VALUES
	('11','1','2','1',NULL),
	('12','1','2','2',NULL),
	('13','1','1','2',NULL),
	('14','1','2','1',NULL),
	('15','1','2','1',NULL),
	('21','2','3','1','Quarto com pouca luminosidade'),
    ('22','2','2','2',NULL),
    ('23','2','3','3',NULL),
    ('24','2','4','3',NULL),
    ('25','2','2','3',NULL),
    ('31','3','4','4',NULL),
    ('32','3','2','4',NULL),
    ('33','3','3','5',NULL),
    ('34','3','4','4',NULL),
    ('35','3','1','4',NULL),
    ('41','4','2','6',NULL),
    ('42','4','3','7',NULL),
    ('43','4','4','6','Otima vista para a Universidade do Minho'),
    ('44','4','5','6',NULL),
    ('45','4','3','7',NULL),
    ('51','5','3','8',NULL),
    ('52','5','2','9',NULL),
    ('53','5','2','9',NULL),
    ('54','5','2','8',NULL),
    ('55','5','1','8',NULL),
	('61','6','4','9',NULL),
	('62','6','2','9',NULL),
	('63','6','2','10','Melhor quarto do hotel');

-- Povoamento da Tabela `hotel`.`Reserva`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`Reserva`;
-- SELECT * FROM `hotel`.`Reserva`;
INSERT INTO `hotel`.`Reserva` 
	(Codigo,DataCheckIn,DataCheckOut,DataReserva,Cliente_id)
VALUES
	('111','2020-02-26', '2020-02.28', '2020-02-14', '4'),
    ('112','2020-05-05', '2020-05-07', '2020-02-14', '4'),
	('113','2020-07-14', '2020-07-16', '2020-02-14', '4'),
    ('114','2020-06-05', '2020-06-10', '2020-05-04', '2'),
    ('115','2020-07-05', '2020-07-10', '2020-06-10', '27'),
    ('116','2020-01-03', '2020-01-10', '2019-11-23', '3'),
    ('117','2020-10-14', '2020-10-16', '2020-10-14', '7'),
    ('118','2020-11-21', '2020-11-23', '2020-10-16', '3'),
    ('119','2019-12-01', '2019-12-05', '2019-11-15', '24'),
    ('120','2020-04-11', '2020-04-17', '2020-02-18', '13'),
	('121','2020-06-05', '2020-06-10', '2020-05-04', '20'),
    ('122','2020-01-05', '2020-01-10', '2019-12-10', '10'),
    ('123','2020-01-03', '2020-01-10', '2019-11-23', '11'),
    ('124','2020-06-14', '2020-06-16', '2020-04-14', '8'),
    ('125','2020-11-21', '2020-11-23', '2020-10-16', '18'),
    ('126','2019-12-01', '2019-12-05', '2019-11-15', '6'),
    ('127','2020-05-11', '2020-09-17', '2020-04-18', '23'),
	('128','2020-05-14', '2020-05-16', '2020-04-14', '18'),
    ('129','2020-11-21', '2020-11-23', '2020-10-16', '1'),
    ('130','2019-10-01', '2019-10-05', '2019-10-01', '5');
    

    
    
    

-- Povoamento da Tabela `hotel`.`ReservaQuarto`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`ReservaQuarto`; 
-- SELECT * FROM `hotel`.`ReservaQuarto`; 
INSERT INTO `hotel`.`ReservaQuarto` 
	(Reserva_Codigo,Quarto_Numero1,Preco)
VALUES
	('111','42','65'),
    ('112','31','95'),
	('113','61','100'),
    ('114','45','65'),
    ('115','21','25'),
    ('116','11','25'),
    ('117','62','100'),
    ('118','51','80'),
    ('119','35','95'),
    ('120','54','80'),
    ('121','13','45'),
    ('122','34','95'),
    ('123','45','65'),
    ('124','53','100'),
    ('125','63','132'),
    ('126','14','25'),
    ('127','32','95'),
	('128','33','120'),
    ('129','62','100'),
    ('130','41','50');
    

-- Povoamento da Tabela `hotel`.`Servico`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`Servico`;
-- SELECT * FROM `hotel`.`Servico`;
INSERT INTO `hotel`.`Servico` 
	(Codigo,Descricao,Valor,Tipo_de_Servico)
VALUES
	('1','Acesso ao mini bar no seu quarto','10.54','MiniBar'),
    ('2','Acesso ao campo de futebol','35.00','Campo de futebol'),
	('3','Estadia com pequeno almoço servido no quarto','27.45','Pequeno Almoco na Cama'),
    ('4','Acesso ao jacuzzi do hotel','40.00','Jacuzzi'),
    ('5','Acesso a piscina do hotel','20.57','Piscina'),
    ('6','Acesso ao spa do hotel','56.38','Spa'),
    ('7','Limpeza de quarto diaria','35.00','Limpeza Diária'),
    ('8','Acesso ao casino do hotel','23.00','Casino'),
    ('9','Acesso a sauna do hotel','46.00','Sauna'),
    ('10','Acesso ao ginasio do hotel','10.00','Ginasio'),
    ('11','Acesso a biblioteca do hotel','05.99','Biblioteca');
    


-- Povoamento da Tabela `hotel`.`ReservaServico`
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- DELETE FROM `hotel`.`ReservaServico`;
-- SELECT * FROM `hotel`.`ReservaServico`;
INSERT INTO `hotel`.`ReservaServico` 
	(Servico_Codigo_Servico,Reserva_Codigo,Preco)
VALUES
	('4','111','10.54'),
    ('2','112','35.00'),
	('7','113','27.45'),
    ('1','114','40.00'),
    ('9','116','10.57'),
    ('5','117','56.38'),
    ('3','118','35.00'),
    ('8','119','15.99'),
    ('2','120','35.00'),
    ('6','121','56.38'),
    ('4','122','10.54'),
    ('10','123','10.00'),
    ('8','124','23.00'),
    ('1','125','10.54'),
    ('2','126','35.00'),
    ('8','127','23.00'),
	('5','128','20.57'),
    ('7','129','35.00'),
    ('4','130','40.00');
    




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
