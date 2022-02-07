﻿#language: ru

Функционал: Проверка работы механизмов документа Заказ (подсистемы Продажи)

Как Инженер тестировщик я хочу
Проверка работоспособности механизмов документа Заказ
1. Проверика механизма авто расчета суммы документа Заказ при изменении количества и цены
2. Проверка внесения изменений в поле Количество у строки с Услугой в табличной части документа Заказ
чтобы убедиться в работоспособности механизмов документа Заказ

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка механизма авто расчета суммы
* Загрузка начальных данных
	И я закрываю все окна клиентского приложения
	И заполнение констант для тестирования документа Заказ клиента
	И заполняю тестовые данные для тестирования документа Заказ клиента
* Создание документа Заказ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Когда открылось окно 'Заказ (создание)'		
* Заполнение шапки документа
	И заполняю шапку документа Заказ клиента
* Заполнение табличной части товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Sony К3456P'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '9 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Доставка'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка авто расчета суммы при изменении Количества товара
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Сумма'    | 'Товар'       | 'Цена'     |
		| '1'          | '9 000,00' | 'Sony К3456P' | '9 000,00' |	
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	Тогда текст текущей ячейки таблицы "Товары" стал равен '90 000,00'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '90 300'
* Проверка авто расчета суммы при изменении Цены товара
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '5 000,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	Тогда текст текущей ячейки таблицы "Товары" стал равен '50 000,00'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '50 300'
	И в таблице "Товары" я завершаю редактирование строки
* Закрываю и сохраняю документ
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
	И Я закрываю окно 'Заказы товаров'
	