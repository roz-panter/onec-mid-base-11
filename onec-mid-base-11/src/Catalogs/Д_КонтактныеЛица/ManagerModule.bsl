#Область СлужебныеПроцедурыИФункции

Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("ДействуетНаОсновании");
	
КонецПроцедуры     

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;  
	Если ЗначениеЗаполнено(Данные.ДействуетНаОсновании) Тогда
		Представление = Данные.Наименование + " (на основании " + Данные.ДействуетНаОсновании + ")";
	Иначе
		Представление = Данные.Наименование;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти