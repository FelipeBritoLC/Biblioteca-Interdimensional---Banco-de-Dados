-- Inserir classes na tabela CLASSE
INSERT INTO CLASSE (nome, descricao) VALUES
('Seres Monstruosos', 'Criaturas com formas híbridas ou deformadas, geralmente ameaçadoras e com características físicas extraordinárias.'),
('Seres Míticos', 'Seres extraordinários de mitologias que possuem habilidades especiais, poderosos e muitas vezes ligados a divindades.'),
('Seres Híbridos', 'Criaturas que combinam traços de diferentes espécies, geralmente metade humano e metade animal.'),
('Seres Sobrenaturais', 'Entidades com habilidades mágicas, poderes místicos ou relacionadas à morte e aos elementos sobrenaturais.'),
('Animais Místicos', 'Animais com poderes extraordinários, habilidades mágicas, ou que têm significados simbólicos.'),
('Semi-Deus e Deuses', 'Seres com poderes extraordinários, descendentes de deuses ou divindades completas que habitam mitologias.'),
('Seres Magos e Bruxos', 'Indivíduos que possuem habilidades de manipular e controlar a magia.'),
('Seres Humanos', 'Seres terrestres comuns sem habilidades especiais.');

-- Inserir criaturas na tabela CRIATURA sem as datas de nascimento
INSERT INTO CRIATURA (nome, descricao, classe) VALUES
-- Seres Monstruosos
('Cérbero', 'Cão de três cabeças que guarda o submundo.', 'Seres Monstruosos'),
('Minotauro', 'Criatura com corpo de homem e cabeça de touro.', 'Seres Monstruosos'),
('Hidra de Lerna', 'Serpente de várias cabeças que se regeneram.', 'Seres Monstruosos'),
('Ciclope', 'Gigante com um olho só.', 'Seres Monstruosos'),
('Quimera', 'Criatura híbrida de leão, cabra e serpente.', 'Seres Monstruosos'),
('Grifo', 'Metade leão, metade águia.', 'Seres Monstruosos'),
('Jörmungandr', 'Serpente gigante que circunda o mundo.', 'Seres Monstruosos'),
('Fenrir', 'Lobo monstruoso.', 'Seres Monstruosos'),
('Trolls', 'Gigantes monstruosos das montanhas.', 'Seres Monstruosos'),
('Beholder', 'Criatura flutuante com um grande olho central e tentáculos com olhos.', 'Seres Monstruosos'),
('Mind Flayer', 'Criatura com cabeça de polvo e poderes psíquicos.', 'Seres Monstruosos'),
('Gelatina Cuboide', 'Massa gelatinosa que dissolve qualquer coisa em seu caminho.', 'Seres Monstruosos'),
('Naga', 'Serpentes semi-divinas.', 'Seres Monstruosos'),
('Dragão Chinês', 'Serpente gigante com poderes de controle sobre o clima.', 'Seres Monstruosos'),
('Wargs', 'Lobos gigantes.', 'Seres Monstruosos'),
('Murloc', 'Criaturas aquáticas humanoides.', 'Seres Monstruosos'),
('Gnoll', 'Criaturas meio humanas, meio hiena.', 'Seres Monstruosos'),
('Cão Infernal', 'Cachorro gigante do submundo.', 'Seres Monstruosos'),

-- Seres Míticos
('Medusa', 'Górgona com cabelos de serpente que transforma em pedra quem a olha nos olhos.', 'Seres Míticos'),
('Pegasus', 'Cavalo alado.', 'Seres Míticos'),
('Rakshasa', 'Demônios com habilidades mágicas.', 'Seres Míticos'),
('Garuda', 'Pássaro gigante, montaria de Vishnu.', 'Seres Míticos'),
('Valkírias', 'Guerreiras que escolhem os que morrerão nas batalhas.', 'Seres Míticos'),
('Draenei', 'Seres alienígenas com poderes mágicos.', 'Seres Míticos'),
('Dracaenae', 'Mulheres-serpentes guerreiras.', 'Seres Míticos'),

-- Seres Híbridos
('Centauro', 'Metade homem, metade cavalo.', 'Seres Híbridos'),
('Sátiro', 'Metade homem, metade bode.', 'Seres Híbridos'),
('Hipogrifo', 'Metade cavalo, metade águia.', 'Seres Híbridos'),
('Selkie', 'Criaturas que podem se transformar de focas em humanos.', 'Seres Híbridos'),
('Fauno', 'Criaturas com corpo humano e pernas de cabra.', 'Seres Híbridos'),
('Empousa', 'Vampira demônio com uma perna de bronze e outra de burro.', 'Seres Híbridos'),

-- Seres Sobrenaturais
('Dementador', 'Criatura sombria que suga a felicidade.', 'Seres Sobrenaturais'),
('Thestral', 'Cavalo alado esquelético visível apenas para quem viu a morte.', 'Seres Sobrenaturais'),
('Banshee', 'Espírito feminino que anuncia a morte com seu grito.', 'Seres Sobrenaturais'),
('Pooka', 'Espírito travesso que pode se transformar em várias formas.', 'Seres Sobrenaturais'),
('White Walker', 'Seres gelados que podem reanimar os mortos.', 'Seres Sobrenaturais'),
('Nazgûl', 'Espectros a serviço de Sauron.', 'Seres Sobrenaturais'),
('Draugr', 'Mortos-vivos guardiões de tumbas.', 'Seres Sobrenaturais'),

-- Animais Místicos
('Nundu', 'Felino gigantesco com hálito mortal.', 'Animais Místicos'),
('Dragão', 'Criaturas aladas capazes de cuspir fogo.', 'Animais Místicos'),
('Benu', 'Ave sagrada semelhante a uma garça.', 'Animais Místicos'),
('Qilin', 'Criatura mística semelhante a um cervo com chifres e escamas.', 'Animais Místicos'),
('Huli Jing', 'Raposa mágica com múltiplas caudas.', 'Animais Místicos'),

-- Seres Magos e Bruxos
('Bruxo', 'Indivíduos que possuem habilidades de manipular e controlar a magia.', 'Seres Magos e Bruxos'),
('Mago', 'Indivíduo com vasto conhecimento mágico e habilidades arcanas, capaz de manipular as forças da magia.', 'Seres Magos e Bruxos'),

-- Semi-Deus e Deuses
('Semi-Deus', 'Seres nascidos da união entre um deus e um mortal, possuindo força, habilidades e características divinas.', 'Semi-Deus e Deuses'),
('Deus Grego', 'Seres poderosos que governam aspectos da vida e da natureza, com personalidades humanas e habilidades divinas.', 'Semi-Deus e Deuses'),
('Humano', 'Espécie inteligente do planeta Terra.', 'Seres Humanos');

-- Inserir características na tabela CARACTERISTICA
INSERT INTO CARACTERISTICA (descricao, classe) VALUES
-- Características para Seres Monstruosos
('Criaturas com aparência aterrorizante e habilidades especiais.', 'Seres Monstruosos'),
('Seres que costumam ter um aspecto físico imponente ou ameaçador.', 'Seres Monstruosos'),

-- Características para Seres Míticos
('Criaturas frequentemente associadas a antigas religiões e mitologias.', 'Seres Míticos'),

-- Características para Seres Híbridos
('Criaturas que combinam características de diferentes espécies.', 'Seres Híbridos'),
('Seres que frequentemente têm a capacidade de se adaptar a múltiplos ambientes.', 'Seres Híbridos'),

-- Características para Seres Sobrenaturais
('Seres com poderes ou habilidades que desafiam as leis naturais.', 'Seres Sobrenaturais'),
('Criaturas que possuem uma conexão direta com o mundo espiritual ou etéreo.', 'Seres Sobrenaturais'),
('Seres que frequentemente têm uma presença impactante ou um efeito emocional sobre os vivos.', 'Seres Sobrenaturais'),
('Seres geralmente conectados a morte.', 'Seres Sobrenaturais'),

-- Características para Animais Místicos
('Criaturas com habilidades especiais relacionadas ao ambiente natural ou mágico.', 'Animais Místicos'),
('Seres frequentemente associados a forças naturais ou divinas.', 'Animais Místicos'),
('Criaturas que possuem características visivelmente místicas ou encantadoras.', 'Animais Místicos'),

-- Características para Seres Magos e Bruxos
('Seres que possuem a capacidade de manipular e controlar a magia.', 'Seres Magos e Bruxos'),
('Criaturas ou indivíduos com profundo conhecimento em feitiçaria e encantamentos.', 'Seres Magos e Bruxos'),
('Seres que frequentemente têm habilidades excepcionais em rituais e magia.', 'Seres Magos e Bruxos'),

-- Características para Semi-Deus e Deuses
('Possuem habilidades extraordinárias como força sobre-humana, controle de elementos ou poderes divinos herdados.', 'Semi-Deus e Deuses'),

-- Características para Humanos
('Seres simples que a princípio não possuem habilidades especiais ou algum tipo de poder.', 'Seres Humanos'),
('Possuem um potencial enorme, podendo adquirir dons e habilidades mágicas através de experiências místicas.', 'Seres Humanos');

-- Inserindo universos associados a heróis
INSERT INTO UNIVERSO (nome, ano_surgimento, historia_origem) VALUES
('Hogwarts', 1991, 'Universo mágico de Hogwarts, onde bruxos e feiticeiros praticam magia.'),
('Monte Olimpo', 2, 'Universo onde Deuses e Semi-Deuses vivem suas trajetórias.'),
('Grã-Bretanha',400, 'Reino lendário medieval e mágico da Bretanha, onde o Rei Arthur empunha a espada Excalibur e enfrenta várias aventuras.'),
('Ilha dos Dragões', 200, 'Terra natal de muitos dragões, onde eles vivem e treinam.'),
('Terra 616', 1965, 'Universo onde os mutantes são originados.');


-- Inserindo heróis associados a criaturas
INSERT INTO HEROI (nome, data_nasc, historia, idcriatura_associada, iduniverso_origem) VALUES
('Harry Potter', '1992-07-31', 'O famoso bruxo que sobreviveu e derrotou Voldemort.', 92, 6),
('Perseu', '1190-01-01', 'Herói grego que derrotou Medusa.', 94, 7),
('Hércules', '1200-01-01', 'Herói grego conhecido por sua força e por completar os 12 Trabalhos.', 94, 7),
('Arthur', '500-01-01', 'Rei lendário da Bretanha, portador da espada Excalibur.', 96, 8),
('Merlim', '200-11-04', 'Lendário mago da era medieval, conhecido por sua sabedoria, poderes mágicos e papel crucial como conselheiro do Rei Arthur.', 93, 8),
('Banguela', '300-06-02', 'Dragão raro da espécie Fúria da Noite, inteligente, ágil, com habilidades de voo excepcionais e poderosa rajada de fogo.', 88, 9),
('Marsias', '1300-09-04', 'Um sátiro habilidoso com a flauta, desafiou Apolo em um concurso musical. Sua bravura em enfrentar um deus e sua arte o tornaram um herói trágico da mitologia grega..', 75, 7),
('Percy Jackson', '2003-01-23', 'Filho de Poseidon, se tornou um herói ao recuperar raio roubado de Zeus', 94, 7);

INSERT INTO nivel_perigo (nome) VALUES
('inofensivo'),
('muito baixo'),
('baixo'),
('medio'),
('alto'),
('muito alto'),
('morte certa');


