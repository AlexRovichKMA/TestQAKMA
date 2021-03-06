#language: ru

@tree

Функционал: Заполнение поля Организация в заказе покупателя

Как тестировщик я хочу
Проверить заполнение поля организация и если не заполненно, то запонить 
чтобы увеличить стабильность теста с заполнением организации

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _2401 подготовительный сценарий
	Когда экспорт основных данных

Сценарий: _2403 заполнить организацию если не заполнена
	* Открывается заказ покупателя и заполняется шапка
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
		И я нажимаю на кнопку с именем 'FormChoose'
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'                                        |
			| 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
		И я нажимаю на кнопку с именем 'FormChoose'
	* Проверка заполнения Организации и заполнение
	Если элемент формы с именем "Company" стал равен '' Тогда
		И я нажимаю кнопку выбора у поля с именем "Company"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'           |
			| 'Собственная компания 1' |
		И я нажимаю на кнопку с именем 'FormChoose'
	* Финальная проверка корректности заполнения формы
	Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
	Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'
	