﻿#language: ru

@tree

Функционал: использование переменных

Как тестировщик я хочу
проверить как работать с переменными
чтобы запомнить примеры

Сценарий: использование локальных переменных
	И я запоминаю текущее окно как "ЗаголовокПоступленияТоваров"
	И я вывожу значение переменной "ЗаголовокПоступленияТоваров"
	
Сценарий: использование глобальных переменных
	И я закрываю все окна клиентского приложения
	И я удаляю переменную '$$СсылкаТоварБезХарактеристик$$'
	И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаТоварБезХарактеристик$$"
	И Я открываю навигационную ссылку "$$СсылкаТоварБезХарактеристик$$"

	