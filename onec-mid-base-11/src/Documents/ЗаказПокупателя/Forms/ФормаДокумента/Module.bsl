#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
		
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);

КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(Строка)
//++Карасева О.В. 14.10.2023 : расчет суммы строки таблицы с учетом скидки	
     Д_ПересчитатьСуммуСоСкидкой(Строка)   
//++Карасева О.В.
	
//	РассчитатьСуммуДокумента();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

 
 &НаКлиенте
 Процедура КомандаПересчитатьТаблицу(Команда)  
//++Карасева О.В. 14.10.2023 :  Пересчет суммы с учетом скидки при нажатии кнопки "Пересчитать таблицу"
   	Д_ПересчитатьТаблицуСоСкидкой();
//++Карасева О.В.
КонецПроцедуры   

&НаКлиенте
Процедура Д_ПересчитатьТаблицуСоСкидкой() 
//++Карасева О.В. 14.10.2023:  пересчет суммы  каждой строке таблицы
	
	Для Каждого Строка Из Объект.Товары Цикл	
		Д_ПересчитатьСуммуСоСкидкой(Строка);
	КонецЦикла;
	
	Для Каждого Строка Из Объект.Услуги Цикл
		Д_ПересчитатьСуммуСоСкидкой(Строка);
	КонецЦикла;
	
	РассчитатьСуммуДокумента(); 
//++Карасева О.В. 	  
КонецПроцедуры

&НаКлиенте
Процедура Д_ПересчитатьСуммуСоСкидкой(Знач Строка)
	//++Карасева О.В. 14.10.2023 : пересчет значения суммы в строке таблицы с учетом скидки
	КоэффициентОбщейСкидки = Д_РассчитатьКоэффициентОбщейСкидки(Строка);
	
	Если (Строка.Скидка + Объект.Д_СогласованнаяСкидка) >= 100 Тогда
		Текст = "Общая сумма скидки по номенклатуре %1 превышает или равна 100%. Необходимо уточнить размер скидки.";
		ШаблонСтроки = СтрЗаменить(Текст, "%1", Строка.Номенклатура);
		Сообщить(ШаблонСтроки); 
		Строка.Сумма = 0;
	Иначе 
		Строка.Сумма = Строка.Цена * Строка.Количество * КоэффициентОбщейСкидки;	
	КонецЕсли;
	//++Карасева О.В.
	
КонецПроцедуры


&НаКлиенте
Асинх Процедура Д_СогласованнаяСкидкаПриИзменении(Элемент)    
//++Карасева О.В. 14.10.2023 : Вывод вопроса пользователю при изменении размера скидки		
	Режим = РежимДиалогаВопрос.ДаНет;
	Ответ = Ждать ВопросАсинх("Размер скидки изменился. Пересчитать сумму документа?", Режим, 0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
		 Д_ПересчитатьТаблицуСоСкидкой();   
	Иначе
		Возврат;
	КонецЕсли;
//++Карасева О.В. 	
КонецПроцедуры

&НаКлиенте
Функция Д_РассчитатьКоэффициентСкидки(Строка)
		
	КоэффициентСкидки = 1 - Строка.Скидка / 100;
	Возврат КоэффициентСкидки;

КонецФункции

&НаКлиенте
Функция Д_РассчитатьКоэффициентОбщейСкидки(Строка)
		
	КоэффициентОбщейСкидки = 1 - (Объект.Д_СогласованнаяСкидка + Строка.Скидка)  / 100;
	Возврат КоэффициентОбщейСкидки;

КонецФункции

#КонецОбласти

#КонецОбласти



