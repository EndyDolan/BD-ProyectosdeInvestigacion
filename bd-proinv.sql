create database [Proyectos de Investigacion]
go 
use [Proyectos de Investigacion]
go
create table [Entidad Financiadora](--llena
entidad_financiadora char (20) not null,
nombre varchar (50) not null,
constraint pk_cod_ent primary key (entidad_financiadora),
constraint uq_cod_ent unique (entidad_financiadora)
);
go
create table[Relacion Plan](--llena
codigo_plan char (20) not null,
nombre varchar (100) not null,
entidad_financiadora char (20) not null
constraint pk_cod_p primary key (codigo_plan),
constraint uq_cod_p unique (codigo_plan),
constraint fk_ent_fin foreign key (entidad_financiadora) references [Entidad Financiadora](entidad_financiadora));
go
create table [Relacion Proyecto](--llena
codigo_proyecto char (20) not null,
codigo_plan char (20) not null,
nombre char (50)  not null,
fecha_inicio date default (getdate()) not null,--cambiar al pasar en limpio
fecha_fin date not null,
presupuesto integer not null
constraint pk_cod_pro primary key (codigo_proyecto),
constraint uq_cod_pro unique (codigo_proyecto),
constraint fk_cod_p foreign key (codigo_plan) references [Relacion Plan](codigo_plan));
go
ALTER TABLE [Relacion Proyecto] alter column fecha_fin date 
ALTER TABLE [Relacion Proyecto] alter column fecha_inicio date not null
go
create table Ciudad (--llena
ciudad char (15) not null,
nombre varchar (50) not null,
constraint pk_ciu primary key (ciudad),
constraint uq_ciu unique (ciudad));
go
create table Investigadores(--llena
dni_investigador char (9) not null,
nombre varchar (50) not null,
ciudad char (15)not null,
telefono char (12) not null,
constraint pk_cod_in primary key (dni_investigador),
constraint uq_cod_in unique (dni_investigador),
constraint fk_ciu foreign key (ciudad) references Ciudad (ciudad));
go
create table [Tipo Participacion](--LLENA
tipo_participacion char (20) not null,
nombre varchar (50) not null,
constraint pk_codtp primary key (tipo_participacion),
constraint uq_codtp unique (tipo_participacion));
go
create table [Relacion Asignado_A](
codigo_proyecto char(20) not null,
dni_investigador char (9) not null,
fecha_ini date default (getdate()) not null,
fecha_fin date not null,
tipo_participacion char (20) not null,
constraint f_k_cod_pro foreign key (codigo_proyecto) references [Relacion Proyecto](codigo_proyecto),
constraint fk_cod_in foreign key (dni_investigador) references Investigadores(dni_investigador),
constraint fk_cod_tp foreign key (tipo_participacion) references [Tipo Participacion](tipo_participacion)
);
go
--llenado de entidad financiadora
insert into [Entidad Financiadora](entidad_financiadora, nombre)
values ('CICYT','Banco Agricola')--1
insert into [Entidad Financiadora](entidad_financiadora, nombre)
values ('BDVIv','Banco DaVivienda')--2cicit
insert into [Entidad Financiadora](entidad_financiadora, nombre)
values ('BnKhP','Banco Hipotecario')--3

--llenado de tabla relacion plan
insert into [Relacion Plan](codigo_plan, nombre, entidad_financiadora)
values ('PEUR','Plan Universidad Tecnologica','CICYT')
insert into [Relacion Plan](codigo_plan, nombre, entidad_financiadora)
values ('SOCRATES','Plan Socrates SV','BnKhP')
insert into [Relacion Plan](codigo_plan, nombre, entidad_financiadora)
values ('plan 2002','Plan El Salvador 2002','BDVIv')

--llenado de tabla relacion proyecto
select * from [Relacion Proyecto]--cambiar fecha de finalizacion jajajajjaj
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('PEUR-01','PEUR','NEPTUNO','12/09/1998','12/09/2019',90.00)--NEPTUNO
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio ,fecha_fin, presupuesto)
values ('SOCRATES-01','SOCRATES','EURO PROYECTO','20/09/1999','20/09/2014',95.00)--euro proycto
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('SOCRATES-02','SOCRATES','BDI','12/05/2007','12/05/2020',128745.00)--bdi fecha fin nulla
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('PEUR-02','PEUR','FOLRE','12/06/2010', '12/06/2021',125.00)--folre
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('plan 2002-01','plan 2002','JUPITER','12/07/1999','12/07/2022',300.00)
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('plan 2002-02','plan 2002','ALFA-PRO','12/08/2000','12/08/2019',99.95)
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('plan 2002-03','plan 2002','BASES_D','12/09/2012','12/09/2028',50.00)
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('PEUR-03','PEUR','OCTAGONO','12/10/2015','12/10/2030',7000.00)
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('SOCRATES-03','SOCRATES','BETA_P','12/11/2014','12/11/2032',45000.00)
insert into [Relacion Proyecto](codigo_proyecto, codigo_plan, nombre, fecha_inicio, fecha_fin, presupuesto)
values ('SOCRATES-04','SOCRATES','PR_FINAL','31/12/2002','31/12/2018',10000.00)


--llenado de tabla ciudad 
insert into Ciudad (ciudad, nombre)
values ('cdm542','Madrid')
insert into Ciudad (ciudad, nombre)
values ('cdB599','Barcelona')
insert into Ciudad (ciudad, nombre)
values ('cdCK9875','Cuenca')
insert into Ciudad (ciudad, nombre)
values ('cdCR-007','La Coruña')
insert into Ciudad (ciudad, nombre)
values ('cdV-7869','Valladolid')
insert into Ciudad (ciudad, nombre)
values ('cdT-458','Taragona')
insert into Ciudad (ciudad, nombre)
values ('cdS-9945','Soria')
SELECT *FROM Ciudad

--llenado de tabla investigadores
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN01','Walter Ramirez','cdm542','7865-7799')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN02','Irvin Villalta','cdB599','7245-3219')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN03','Eduardo Tamayo','cdm542','8745-9364')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN04','Marta Ramirez','cdB599','6548-1254')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN05','Juan Mejia','cdCR-007','2587-4554')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN06','Abigail Reyes','cdT-458','4587-3217')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN07','Jorge Vasquez','cdV-7869','6678-9874')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN08','Gilton Perez','cdCR-007','4587-0045')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN09','Jacqueline Aguirre','cdCK9875','1178-6578')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN10','Rodrigo Perez','cdm542','4587-2345')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN11','Oscar Carrillo','cdCK9875','6487-9854')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN12','Alfredo Ponce','cdT-458','6487-2554')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN13','Samuel Cortez','cdB599','7854-9854')
insert into Investigadores(dni_investigador, nombre, ciudad, telefono)
values ('Co_IN14','Oscar Ramos','cdT-458','6487-9324')
select * from Investigadores

--llenado tabla tipo de participacion
insert into [Tipo Participacion](tipo_participacion, nombre)
values ('Cod-TP--IP','Investigador Principal')
insert into [Tipo Participacion](tipo_participacion, nombre)
values ('Cod-TP--IATC','Investigador A Tiempo Completo')
insert into [Tipo Participacion](tipo_participacion, nombre)
values ('Cod-TP--IATP','Investigador A Tiempo Parcial')
insert into [Tipo Participacion](tipo_participacion, nombre)
values ('Cod-TP--IB','Investigador Becario')
insert into [Tipo Participacion](tipo_participacion, nombre)
values ('Cod-TP--IAX','Investigador Auxiliar')
select *from [Tipo Participacion]

--llenado de tabla asignacion 
SELECT *FROM [Relacion Asignado_A]
select * from [Relacion Proyecto]
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('PEUR-01','Co_IN01','12/11/2025','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('PEUR-01','Co_IN05','12/11/2025','Cod-TP--IATC')
--
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('PEUR-02','Co_IN08','12/11/2022','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('PEUR-02','Co_IN07','12/11/2022','Cod-TP--IATC')
--/*
--*/
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('plan 2002-02','Co_IN09','12/11/2020','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('plan 2002-02','Co_IN06','12/11/2020','Cod-TP--IAX')
--
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('plan 2002-03','Co_IN06','12/11/2018','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('plan 2002-03','Co_IN12','12/11/2018','Cod-TP--IATC')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('plan 2002-03','Co_IN07','12/11/2018','Cod-TP--IAX')
--/*
--*/
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-01','Co_IN06','12/11/2030','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-01','Co_IN09','12/11/2030','Cod-TP--IATC')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-01','Co_IN07','12/11/2030','Cod-TP--IATP')
--
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-02','Co_IN11','12/11/2028','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-02','Co_IN13','12/11/2028','Cod-TP--IAX')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-02','Co_IN10','12/11/2028','Cod-TP--IAX')
--
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-04','Co_IN05','12/11/2026','Cod-TP--IP')
insert into [Relacion Asignado_A](codigo_proyecto, dni_investigador, fecha_fin, tipo_participacion)
values('SOCRATES-04','Co_IN11','12/11/2026','Cod-TP--IAX')
SELECT * FROM [Relacion Asignado_A]