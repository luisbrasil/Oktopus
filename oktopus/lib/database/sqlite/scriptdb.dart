const criarUsuario = '''
 CREATE TABLE usuario(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,cpf VARCHAR(14) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';

const insercoesUsuario = [
  '''
INSERT INTO usuario (nome, cpf, email, url_avatar)
VALUES ('Pedro Kusiak','664.334.260-00','pedrokusiak@gmail.com','https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png')
''',
  '''
INSERT INTO usuario(nome, cpf, email, url_avatar)
VALUES ('Vinicius Koiti','289.957.110-94', 'viniciuskoiti@gmail.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png')
''',
  '''
INSERT INTO usuario (nome, cpf, email, url_avatar)
VALUES ('Felipe da Hora','034.071.910-90','lipedahora@gmail.com','https://cdn.pixabay.com/photo/2017/04/30/11/42/hijab-2272708_1280.png')
''',
  '''
INSERT INTO usuario (nome, cpf, email, url_avatar)
VALUES ('Rafael Scarpelli','123.432.123-22','rafaelscarpelli@gmail.com','https://uploads.spiritfanfiction.com/historias/capas/202009/thats-my-girl--imagine-nayeon-twice-20504992-160920201356.png')
'''
];

const criarReview = '''
 CREATE TABLE review(
    id INTEGER NOT NULL PRIMARY KEY
    ,agendamento_id INTEGER NOT NULL
    ,descricao VARCHAR(150) NOT NULL
    ,estrelas INTEGER NOT NULL
    ,FOREIGN KEY (agendamento_id) REFERENCES agendamento (id) 
  )
''';

const insercoesReview = [
  '''
INSERT INTO review (agendamento_id, descricao, estrelas)
VALUES (1,'muito bom joinha',5)
''',
  '''
INSERT INTO review (agendamento_id, descricao, estrelas)
VALUES (2,'maluco meteu uma tatuagem de chiclete',2)
''',
  '''
INSERT INTO review (agendamento_id, descricao, estrelas)
VALUES (3,'冰淇淋',5)
''',
  '''
INSERT INTO review (agendamento_id, descricao, estrelas)
VALUES (4,'doeu pakas',1)
'''
];

const criarAgendamento = '''
 CREATE TABLE agendamento(
    id INTEGER NOT NULL PRIMARY KEY
    ,usuario_id INTEGER NOT NULL
    ,servico_id INTEGER NOT NULL
    ,data DATETIME NOT NULL
    ,FOREIGN KEY (usuario_id) REFERENCES usuario (id) 
    ,FOREIGN KEY (servico_id) REFERENCES servico (id) 
  )
''';

const insercaoAgendamento = [
  '''
INSERT INTO agendamento (usuario_id, servico_id, data)
VALUES (1,1,'2023-06-10 17:30:00')
''',
  '''
INSERT INTO agendamento (usuario_id, servico_id, data)
VALUES (2,2,'2023-06-11 17:30:00')
''',
  '''
INSERT INTO agendamento (usuario_id, servico_id, data)
VALUES (3,3,'2023-06-12 17:30:00')
''',
  '''
INSERT INTO agendamento (usuario_id, servico_id, data)
VALUES (4,4,'2023-06-14 17:30:00')
'''
];

const criarServico = '''
 CREATE TABLE servico(
    id INTEGER NOT NULL PRIMARY KEY
    ,estudio_id INTEGER NOT NULL
    ,nome VARCHAR(50) NOT NULL
    ,descricao VARCHAR(255) NOT NULL
    ,valor FLOAT NOT NULL
  )
''';

const insercoesServico = [
  '''
  INSERT INTO servico (estudio_id, nome, descricao, valor)
  VALUES (1,'Tatuagem nas Costas','30x50',700)
  ''',
  '''
  INSERT INTO servico (estudio_id, nome, descricao, valor)
  VALUES (2,'Tatuagem econômica','5x5',50)
  ''',
  '''
  INSERT INTO servico (estudio_id, nome, descricao, valor)
  VALUES (3,'Tatuagem Chinesa','BING CHILLING',100)
  ''',
  '''
  INSERT INTO servico (estudio_id, nome, descricao, valor)
  VALUES (4,'Piercing no dedão do pé','Não dói',70)
  ''',
];

const criarEstudio = '''
 CREATE TABLE estudio(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,descricao VARCHAR(255) NOT NULL
    ,urlAvatar
  )
''';

const insercoesEstudio = [
  '''
  INSERT INTO estudio (nome, descricao)
  VALUES ('Tinker's Workshop','Estudio técnico')
  ''',
  '''
  INSERT INTO estudio (nome, descricao)
  VALUES ('Lula's Tainting','Só o polvão')
  ''',
  '''
  INSERT INTO estudio (nome, descricao)
  VALUES ('ColorMaster','Estudio bing chilling')
  ''',
  '''
  INSERT INTO estudio (nome, descricao)
  VALUES ('Fura Pé','Venha furar seu pé')
  '''
];

const criarEstudioFavorito = ''' CREATE TABLE estudio_favorito (
  id_usuario INT,
  id_estudio INT,
  data_adicionado DATETIME DEFAULT NOW(),
  
  PRIMARY KEY (id_usuario, id_estudio),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
  FOREIGN KEY (id_estudio) REFERENCES estudios(id)
) ''';

const insercoesEstudiosFavorito = [
  '''
  INSERT INTO estudio_favorito (id_usuario, id_estudio)
  VALUES (1,1)
  ''',
  '''
  INSERT INTO estudio_favorito (id_usuario, id_estudio)
  VALUES (2,2)
  ''',
  '''
  INSERT INTO estudio_favorito (id_usuario, id_estudio)
  VALUES (3,3)
  ''',
  '''
  INSERT INTO estudio_favorito (id_usuario, id_estudio)
  VALUES (4,4)
  '''
];