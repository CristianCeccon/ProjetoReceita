

final createTable= '''

  CREATE TABLE usuario(

    id_usuario INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    adm VARCHAR(100) DEFAULT "false",
    status CHAR(1)) DEFAULT "A",

    id_receita INT AUTO_INCREMENT,

    CONSTRAINT fk_receita FOREIGN KEY id_receita REFERENCES receita(id_receita)

  )

  CREATE TABLE receita(

    id_receita INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descrissao VARCHAR(1000) NOT NULL,
    status CHAR(1)) DEFAULT "A",

    id_usuario INT AUTO_INCREMENT,

    CONSTRAINT fk_usuario FOREIGN KEY id_usuario REFERENCES usuario(id_usuario)

  )

  CREATE TABLE tags(

    id_tags INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    status CHAR(1)) DEFAULT "A",

    id_receita INT AUTO_INCREMENT,

    CONSTRAINT fk_receita FOREIGN KEY id_receita REFERENCES receita(id_receita)

  )

  CREATE TABLE ingrediente(

    id_ingrediente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    medida VARCHAR(100) NOT NULL,
    status CHAR(1)) DEFAULT "A",

    id_receita INT AUTO_INCREMENT,

    CONSTRAINT fk_receita FOREIGN KEY id_receita REFERENCES receita(id_receita)
  )

''';

final insertUsuario= '''
  
  INSERT INTO usuario(nome, email)
  VALUES('Cristian','cris@hotmail.com')

  INSERT INTO usuario(nome, email)
  VALUES('Rafael','rafael@hotmail.com')

  INSERT INTO usuario(nome, email)
  VALUES('Joao','joao@hotmail.com')

  INSERT INTO usuario(nome, email)
  VALUES('Jairo','jairo@hotmail.com')

''';

final insertReceita= '''

  INSERT INTO receita(nome, descrissao)
  VALUES('Macarrao bolonesa','uma receita pra domingo em familia, rende 8 porcoes')

  INSERT INTO receita(nome, descrissao)
  VALUES('Bolo de cenoura','uma receita facil que as criancas adoram, rende 10 pedacos')

  INSERT INTO receita(nome, descrissao)
  VALUES('Milk shake','uma receita facil que as criancas adoram, rende 1 copo de 250 ml')

''';

final insertIngrediente= '''
  
  INSERT INTO ingrediente(nome, quantidade, medida)
  VALUES('leite','1','litros')

  INSERT INTO ingrediente(nome, quantidade, medida)
  VALUES('ovo','2','unidade')

  INSERT INTO ingrediente(nome, quantidade, medida)
  VALUES('cenoura','3','unidade')

''';