#language: ru

@tree

Функционал: Создание элемнтов справочника Номенклатура

Как тестировщик я хочу
Проверить как ведет себя система с большим количеством элемнтов номенклатуры
чтобы убедиться в стабильности системы

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _2401 подготовительный сценарий
	Когда экспорт основных данных

Сценарий: _2402 создания большого количества номенклатур
	И я закрываю все окна клиентского приложения
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Номенклатура " + $Шаг$' в переменную "НаименованиеНоменклатуры"
		И Я запоминаю значение выражения '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' в переменную "СсылкаНаОбъект"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'              | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'             | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '$СсылкаНаОбъект$' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$НаименованиеНоменклатуры$' | ''                 | ''               | ''               |          |          |          |          |         |
		
		И я перезаполняю для объекта табличную часть "AddAttributes":
			| 'Ref'              | 'Property'                                                                                           | 'Value'                                                                                 |
			| '$СсылкаНаОбъект$' | 'e1cib/data/ChartOfCharacteristicTypes.AddAttributeAndProperty?ref=b762b13668d0905011eb766bf96b275d' | 'e1cib/data/Catalog.AddAttributeAndPropertyValues?ref=b762b13668d0905011eb766bf96b2761' |
