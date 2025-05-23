﻿#language: ru

@tree
@exportscenarios

Функционал: 02.03 проверка заполнения конкретной константы 

Как тестировщик-автоматизатор я хочу
создать тестовый сценарий по проверке заполнения значений конс
чтобы сократить время на ручное регрессионное тестирование

Контекст:
	Дано расширение с именем "VAExtension" установлено
	//И я подключаю профиль TestClient "Администратор"
	И я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""
	И я закрываю все окна клиентского приложения

Сценарий: Я проверяю заполнение константы "ИмяКонстанты" с синонимом "СинонимКонстанты" значением "ЗначениеКонстанты"
	И Я запоминаю в переменную "НетОшибок" значение "Есть"
	И Я запоминаю в переменную "ИмяКонстантыПерем" значение '[ИмяКонстанты]'
	И Я запоминаю в переменную "ЗначениеКонстантыПерем" значение '[ЗначениеКонстанты]'
	И Я запоминаю в переменную "СинонимКонстантыПерем" значение '[СинонимКонстанты]'
	//И Я запоминаю значение выражения 'Контекст.АбонентскаяПлатаПерем + ";"+ Контекст.РаботыСпециалистаПерем' в переменную "мКонстантыНоменклатура"
	//И я открываю окно функции для технического специалиста (расширение)		//И я получаю состояние текущего объекта (Расширение)
    *Я проверяю заполнение константы
		И В командном интерфейсе я выбираю 'Добавленные объекты (ВКМ)' '$СинонимКонстантыПерем$'
		Тогда открылось окно "$СинонимКонстантыПерем$"
		Если реквизиты формы имеют значение: Тогда
			| 'Имя'                 | 'Значение' | 'КакИскать' |
			| "$ИмяКонстантыПерем$" | ''         | ''          |            
			*я заполняю константу переданным значением из примера
				И я нажимаю кнопку очистить у поля с именем '$ИмяКонстантыПерем$'
				
				Если поле с именем "ВКМ_НоменклатураАбонентскаяПлата" существует тогда
					И я нажимаю кнопку выбора у поля с именем "ВКМ_НоменклатураАбонентскаяПлата"
					И в таблице "Список" я перехожу к строке:
						| 'Наименование'       |
						| 'Абонентская плата' |
					И я нажимаю на кнопку с именем 'ФормаВыбрать'					
				Если поле с именем "ВКМ_НоменклатураРаботыСпециалиста" существует тогда
					И я нажимаю кнопку выбора у поля с именем "ВКМ_НоменклатураРаботыСпециалиста"
					И в таблице "Список" я перехожу к строке:
						| 'Наименование'       |
						| 'Работы специалиста' |
					И я нажимаю на кнопку с именем 'ФормаВыбрать'					
				Иначе
					И в поле с именем '$ИмяКонстантыПерем$' я ввожу текст '$ЗначениеКонстантыПерем$'
				
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				*я проверяю константу на пустое значение
					Если реквизиты формы имеют значение: Тогда
						| 'Имя'                 | 'Значение' | 'КакИскать' |
						| "$ИмяКонстантыПерем$" | ''         | ''          |            
						И я выполняю код встроенного языка
						"""bsl
						Сообщить("Сценарий 02.03 - Ошибка в исходных данных: Не определена константа " + "$ИмяКонстантыПерем$" + " в примере сценария")
						Сообщить("Сценарий 02.03 - Критическая ошибка, выполнение последующих сценариев прервано.");
						"""
						И Я запоминаю в переменную "НетОшибок" значение "Есть"
						И я закрываю все окна клиентского приложения
						Затем я останавливаю выполнение всех сценариев.
					Иначе
						И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
						И я жду закрытия окна '"$СинонимКонстантыПерем$"' в течение 5 секунд
						И я выполняю код встроенного языка
						"""bsl
						Сообщить("Сценарий 02.03 - Исправлено: Константа заполнена")
						"""
						И Я запоминаю в переменную "НетОшибок" значение "Нет"
		Иначе
			И Я запоминаю в переменную "НетОшибок" значение "Нет"
		
	*Я завершаю выполнение срипта
		И Я запоминаю в переменную "ЗнечениеНет" значение "Нет"
        Если 'Контекст.НетОшибок = Контекст.ЗнечениеНет' Тогда
			И я выполняю код встроенного языка      	  
			"""bsl
			Сообщить("Сценарий 02.03 - Проверка константы успешна: " + "$ИмяКонстантыПерем$" + " заполнена")
			"""
			И я закрываю все окна клиентского приложения
		Иначе
			И я выполняю код встроенного языка
			"""bsl
			Сообщить("Сценарий 02.03 - Критическая ошибка, выполнение последующих сценариев прервано.");
			"""
			И я закрываю все окна клиентского приложения
			Затем я останавливаю выполнение всех сценариев
		И я закрываю все окна клиентского приложения