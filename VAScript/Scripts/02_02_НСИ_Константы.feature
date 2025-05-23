﻿#language: ru

@tree
@exportscenarios

Функционал: 02.02 проверка заполнения констант

Как тестировщик-автоматизатор я хочу
создать струкутру по проверке и заолнению заданных в примере кнстант

Контекст:
	Дано расширение с именем "VAExtension" установлено
	//И я подключаю профиль TestClient "Менеджер"
	//И я подключаю TestClient "Этот клиент" логин "VA-test-Востриков" пароль ""
	И я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""
	И я закрываю все окна клиентского приложения

Структура Сценария: я проверяю заполнение констант

	И Я проверяю заполнение константы "ИмяКонстанты" с синонимом "СинонимКонстанты" значением "ЗначениеКонстанты"

Примеры:
|'ИмяКонстанты'                        |'СинонимКонстанты'                                 |'ЗначениеКонстанты' |
|'ВКМ_ИдентификаторГруппыДляОповещения'|'Конст - Идентификатор группы для оповещения (ВКМ)'|'-1002255976240'    |
|'ВКМ_ТокенУправленияТелеграмБотом'    |'Конст - Токен управления телеграм-ботом (ВКМ)'    |'8098109101:AAEduEJDywKj_t6nr2Xf0HxWDE9wbBeKXXM'|
|'ВКМ_НоменклатураАбонентскаяПлата'    |'Конст - Номенклатура абонентская плата (ВКМ)'     |'Абонентская плата' |
|'ВКМ_НоменклатураРаботыСпециалиста'   |'Конст - Номенклатура работы специалиста (ВКМ)'    |'Работы специалиста'|
