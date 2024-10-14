create database sistema_faculdade;

use sistema_faculdade;

create table tbl_aluno(
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(14) not null,
    data_nascimento date not null,
    statuss enum('ativo','inativo')
);

create table tbl_email(
	id int not null primary key auto_increment,
    email varchar(250) not null,
    aluno_id int not null,
    constraint FK_aluno_email foreign key (aluno_id) references tbl_aluno(id)
);

create table tbl_telefone(
	id int not null primary key auto_increment,
    numero varchar(14),
    aluno_id int not null,
    constraint FK_aluno_telefone foreign key (aluno_id) references tbl_aluno(id)
);

create table tbl_endereco(
	id int not null primary key auto_increment,
    logradouro varchar(45) not null,
    bairro varchar(45) not null,
    cep varchar(10) not null,
    cidade varchar(45) not null,
    estado varchar(45) not null,
    pais varchar(45) not null,
    aluno_id int not null,
    constraint FK_aluno_endereco foreign key (aluno_id) references tbl_aluno(id)
);

create table tbl_cursos(
	id int not null primary key auto_increment,
    nome_curso varchar(45) not null,
    duracao int not null,
    grau enum('bacharelado','tecnologo','licenciatura'),
    aluno_id int not null,
    constraint FK_aluno_curso foreign key (aluno_id) references tbl_aluno(id)
);

create table tbl_materia(
	id int not null primary key auto_increment,
    nome_materia varchar(100) not null,
    carga_horaria int not null,
    cursos_id int not null,
    constraint FK_materia_curso foreign key (cursos_id) references tbl_cursos(id)
);

create table tbl_professor(
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(14) not null,
    data_nascimento date not null,
    materia_id int not null,
    constraint FK_professor_materia foreign key (materia_id) references tbl_materia(id)
);

create table tbl_telefone_professor(
	id int not null primary key auto_increment,
    numero varchar(14) not null,
    professor_id int not null,
    constraint FK_professor_telefone foreign key (professor_id) references tbl_professor(id)
);

create table tbl_email_professor(
	id int not null primary key auto_increment,
    email varchar(250) not null,
    professor_id int not null,
    constraint FK_professor_email foreign key (professor_id) references tbl_professor(id)
);

create table tbl_turmas(
	id int not null primary key auto_increment,
    horario int not null,
    materia_id int not null,
    constraint FK_materia_turma foreign key (materia_id) references tbl_materia(id),
    professor_id int not null,
    constraint FK_professor_turma foreign key (professor_id) references tbl_professor(id)
);

create table tbl_notas(
	id int not null primary key auto_increment,
    notas decimal(5,2),
    statuss enum('aprovado','reprovado'),
    aluno_id int not null,
    constraint FK_aluno_notas foreign key (aluno_id) references tbl_aluno(id),
    turmas_id int not null,
    constraint FK_turma_notas foreign key (turmas_id) references tbl_turmas(id)
)


