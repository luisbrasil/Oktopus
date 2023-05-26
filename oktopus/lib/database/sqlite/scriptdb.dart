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
'''
];

const criarReview = '''
 CREATE TABLE review(
    id INTEGER NOT NULL PRIMARY KEY
    ,agendamento INTEGER NOT NULL
    ,descricao VARCHAR(150) NOT NULL
    ,estrelas INTEGER NOT NULL
  )
''';

const insercoesReview = [
  '''
INSERT INTO review (agendamento, descricao, estrelas)
VALUES (0,'muito bom joinha',5')
''',
  '''
INSERT INTO review (agendamento, descricao, estrelas)
VALUES (1,'maluco meteu uma tatuagem de chiclete',2')
''',
  '''
INSERT INTO review (agendamento, descricao, estrelas)
VALUES (2,'冰淇淋',5')
''',
  '''
INSERT INTO review (agendamento, descricao, estrelas)
VALUES (3,'doeu pakas',1')
'''
];
