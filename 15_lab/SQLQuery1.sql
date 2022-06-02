use UNIVER
go
--1
select PULPIT.FACULTY[факультет/@код], 
	TEACHER.PULPIT[факультет/кафедра/@код], 
    TEACHER.TEACHER_NAME[факультет/кафедра/преподаватель/@код]
	    from TEACHER inner join PULPIT
		    on TEACHER.PULPIT = PULPIT.PULPIT
			   where TEACHER.PULPIT = 'ИСиТ' for xml path, root('Список_преподавателей_кафедры_ИСиТ');

--2
--Разработать сценарий создания XML-документа в режиме AUTO на основе SELECT-запроса к таблицам AUDITORIUM 
--и AUDI-TORIUM_TYPE, который содержит следую-щие столбцы: наименование аудитории, наименование типа аудитории и вместимость. Найти только лекционные аудитории. 
select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
	   AUDITORIUM.AUDITORIUM_TYPE,
	   AUDITORIUM.AUDITORIUM_CAPACITY 
		from AUDITORIUM inner join AUDITORIUM_TYPE 
			on AUDITORIUM.AUDITORIUM_TYPE=AUDITORIUM_TYPE.AUDITORIUM_TYPE
Order by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME for xml AUTO,
root('Список_аудиторий'), elements;

--3
--Разработать XML-документ, содержащий дан-ные о трех новых учебных дисциплинах, кото-рые следует добавить в таблицу SUBJECT. 
--Разработать сценарий, извлекающий данные о дисциплинах из XML-документа и добавля-ющий их в таблицу SUBJECT. 
--При этом применить системную функцию OPENXML и конструкцию INSERT… SELECT. 

use UNIVER
go
declare @h int = 0,
	@x varchar(2000)='<?xml version="1.0" encoding="windows-1251" ?>
	<дисциплины>
					   	<дисциплина код="КГиГ" название="Компьютерная геометрия и графика" кафедра="ИСиТ" />
						 <дисциплина код="ОЗИ" название="Основы защиты информации" кафедра="ИСиТ" />
						 <дисциплина код="МПп" название="Математическое программирование п" кафедра="ИСиТ" />
	</дисциплины>';
	   exec sp_xml_preparedocument @h output, @x;
insert SUBJECT select[код], [название], [кафедра] from openxml(@h, '/дисциплины/дисциплина',0)
    with([код] char(10), [название] varchar(100), [кафедра] char(20));
	select * from SUBJECT
delete from SUBJECT where SUBJECT.SUBJECT='КГиГ' or SUBJECT.SUBJECT='ОЗИ' or SUBJECT.SUBJECT='МПп'

--4
insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
	values(22, 'Николаева Е.В.', '07.17.2002',
	'<студент>
		<паспорт серия="КВ" номер="220021700" дата="06.29.2014" />
		<телефон>+375333834114</телефон>
		<адрес>
			<страна>Беларусь</страна>
			<город>Бобруйск</город>
			<улица>Гагарина</улица>
			<дом>41</дом>
			<квартира>11</квартира>
		</адрес>
	</студент>');
select * from STUDENT where NAME = 'Николаева Е.В.';
update STUDENT set INFO = '<студент>
			<паспорт серия="КВ" номер="220021700" дата="06.29.2014" />
			<телефон>+375333834114</телефон>
			<адрес>
			<страна>Беларусь</страна>
			<город>Бобруйск</город>
			<улица>Гагарина</улица>
			<дом>11</дом>
			<квартира>11</квартира>
		</адрес>
	</студент>' where NAME='Николаева Е.В.'
select NAME[ФИО], INFO.value('(студент/паспорт/@серия)[1]', 'char(2)')[Серия паспорта],
	INFO.value('(студент/паспорт/@номер)[1]', 'varchar(20)')[Номер паспорта],
	INFO.query('/студент/адрес')[Адрес]
		from  STUDENT
			where NAME = 'Николаева Е.В.';

--5
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="студент">
<xs:complexType><xs:sequence>
<xs:element name="паспорт" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="серия" type="xs:string" use="required" />
    <xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
    <xs:attribute name="дата"  use="required">
	<xs:simpleType>  <xs:restriction base ="xs:string">
		<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
	 </xs:restriction> 	</xs:simpleType>
     </xs:attribute>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
<xs:element name="адрес">   <xs:complexType><xs:sequence>
   <xs:element name="страна" type="xs:string" />
   <xs:element name="город" type="xs:string" />
   <xs:element name="улица" type="xs:string" />
   <xs:element name="дом" type="xs:string" />
   <xs:element name="квартира" type="xs:string" />
</xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';

--alter table STUDENT alter column INFO xml(Student);
--drop XML SCHEMA COLLECTION Student;
select Name, INFO from STUDENT where NAME='Николаева Е.В.'
