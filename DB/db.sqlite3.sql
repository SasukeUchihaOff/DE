BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Categories" (
	"CategoryID"	INTEGER NOT NULL,
	"Category"	TEXT,
	PRIMARY KEY("CategoryID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Factories" (
	"FactoryID"	INTEGER NOT NULL,
	"Factory"	TEXT,
	PRIMARY KEY("FactoryID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "OrderPositions" (
	"ID"	INTEGER NOT NULL,
	"OrderID"	INTEGER,
	"ProductID"	INTEGER,
	"SizeID"	INTEGER,
	"Amount"	INTEGER,
	"PricePerUnit"	INTEGER,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("OrderID") REFERENCES "Orders"("OrderID"),
	FOREIGN KEY("ProductID") REFERENCES "Products"("ProductID"),
	FOREIGN KEY("SizeID") REFERENCES "Sizes"("SizeID")
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"OrderID"	INTEGER NOT NULL,
	"OrderDate"	TEXT,
	"UserID"	INTEGER,
	PRIMARY KEY("OrderID" AUTOINCREMENT),
	FOREIGN KEY("UserID") REFERENCES "Users"("UserID")
);
CREATE TABLE IF NOT EXISTS "Products" (
	"ProductID"	INTEGER NOT NULL,
	"CategoryID"	INTEGER,
	"SubCategoryID"	INTEGER,
	"Img"	TEXT,
	"ProductName"	TEXT,
	"FactoryID"	INTEGER,
	"Description"	TEXT,
	"Composition"	TEXT,
	"Price"	INTEGER,
	PRIMARY KEY("ProductID" AUTOINCREMENT),
	FOREIGN KEY("CategoryID") REFERENCES "Categories"("CategoryID"),
	FOREIGN KEY("FactoryID") REFERENCES "Factories"("FactoryID"),
	FOREIGN KEY("SubCategoryID") REFERENCES "SubCategories"("SubCategoryID")
);
CREATE TABLE IF NOT EXISTS "Roles" (
	"RoleID"	INTEGER NOT NULL,
	"Role"	TEXT,
	PRIMARY KEY("RoleID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Sizes" (
	"SizeID"	INTEGER NOT NULL,
	"Size"	REAL,
	PRIMARY KEY("SizeID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "StockItems" (
	"ID"	INTEGER NOT NULL,
	"ProductID"	INTEGER,
	"SizeID"	INTEGER,
	"Availiable"	INTEGER,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("ProductID") REFERENCES "Products"("ProductID"),
	FOREIGN KEY("SizeID") REFERENCES "Sizes"("SizeID")
);
CREATE TABLE IF NOT EXISTS "SubCategories" (
	"SubCategoryID"	INTEGER NOT NULL,
	"SubCategory"	TEXT,
	PRIMARY KEY("SubCategoryID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users" (
	"UserID"	INTEGER NOT NULL,
	"MiddleName"	TEXT,
	"FirstName"	TEXT,
	"SecondName"	TEXT,
	"Login"	TEXT,
	"RoleID"	INTEGER,
	PRIMARY KEY("UserID" AUTOINCREMENT),
	FOREIGN KEY("RoleID") REFERENCES "Roles"("RoleID")
);
INSERT INTO "Categories" VALUES (1,'Детская обувь');
INSERT INTO "Categories" VALUES (2,'Женская обувь');
INSERT INTO "Categories" VALUES (3,'Мужская обувь');
INSERT INTO "Factories" VALUES (1,'Малыш-Спорт');
INSERT INTO "Factories" VALUES (2,'Топ-Топ');
INSERT INTO "Factories" VALUES (3,'Лапушка');
INSERT INTO "Factories" VALUES (4,'Тёплые ножки');
INSERT INTO "Factories" VALUES (5,'Северята');
INSERT INTO "Factories" VALUES (6,'Весна');
INSERT INTO "Factories" VALUES (7,'Здоровый шаг');
INSERT INTO "Factories" VALUES (8,'Карапуз');
INSERT INTO "Factories" VALUES (9,'Маленький франт');
INSERT INTO "Factories" VALUES (10,'Барбари');
INSERT INTO "Factories" VALUES (11,'Твой комфорт');
INSERT INTO "Factories" VALUES (12,'Стиль и комфорт');
INSERT INTO "Factories" VALUES (13,'Кожевенные традиции');
INSERT INTO "Factories" VALUES (14,'Модный силуэт');
INSERT INTO "Factories" VALUES (15,'Азимут');
INSERT INTO "Factories" VALUES (16,'Берестов');
INSERT INTO "OrderPositions" VALUES (1,1,1,3,1,2190);
INSERT INTO "OrderPositions" VALUES (2,1,7,5,1,2790);
INSERT INTO "OrderPositions" VALUES (3,2,10,19,1,25000);
INSERT INTO "OrderPositions" VALUES (4,2,13,23,1,7500);
INSERT INTO "OrderPositions" VALUES (5,3,12,21,1,17000);
INSERT INTO "OrderPositions" VALUES (6,3,20,21,1,8565);
INSERT INTO "OrderPositions" VALUES (7,3,22,18,1,7795);
INSERT INTO "OrderPositions" VALUES (8,4,17,23,1,7757);
INSERT INTO "OrderPositions" VALUES (9,4,16,23,1,12340);
INSERT INTO "OrderPositions" VALUES (10,4,15,25,1,7130);
INSERT INTO "OrderPositions" VALUES (11,4,21,19,1,8765);
INSERT INTO "OrderPositions" VALUES (12,4,11,25,1,15000);
INSERT INTO "OrderPositions" VALUES (13,5,25,29,1,9567);
INSERT INTO "OrderPositions" VALUES (14,5,29,29,1,21500);
INSERT INTO "OrderPositions" VALUES (15,5,24,25,1,7890);
INSERT INTO "OrderPositions" VALUES (16,6,26,27,1,24569);
INSERT INTO "OrderPositions" VALUES (17,6,30,31,1,14567);
INSERT INTO "OrderPositions" VALUES (18,6,31,29,1,15670);
INSERT INTO "OrderPositions" VALUES (19,7,6,1,1,4290);
INSERT INTO "OrderPositions" VALUES (20,7,1,4,2,2190);
INSERT INTO "OrderPositions" VALUES (21,7,8,11,1,1690);
INSERT INTO "OrderPositions" VALUES (22,8,28,34,1,25625);
INSERT INTO "OrderPositions" VALUES (23,8,24,27,3,7890);
INSERT INTO "OrderPositions" VALUES (24,8,23,33,2,6550);
INSERT INTO "OrderPositions" VALUES (25,9,2,16,1,2490);
INSERT INTO "OrderPositions" VALUES (26,9,5,5,2,3190);
INSERT INTO "OrderPositions" VALUES (27,10,18,18,1,7550);
INSERT INTO "OrderPositions" VALUES (28,10,15,21,1,7130);
INSERT INTO "OrderPositions" VALUES (29,10,16,19,1,12340);
INSERT INTO "OrderPositions" VALUES (30,10,21,18,2,8765);
INSERT INTO "Orders" VALUES (1,'2026-04-02',3);
INSERT INTO "Orders" VALUES (2,'2026-04-05',17);
INSERT INTO "Orders" VALUES (3,'2026-04-08',7);
INSERT INTO "Orders" VALUES (4,'2026-04-12',15);
INSERT INTO "Orders" VALUES (5,'2026-04-18',12);
INSERT INTO "Orders" VALUES (6,'2026-04-22',9);
INSERT INTO "Orders" VALUES (7,'2026-04-25',14);
INSERT INTO "Orders" VALUES (8,'2026-04-28',20);
INSERT INTO "Orders" VALUES (9,'2026-05-05',5);
INSERT INTO "Orders" VALUES (10,'2026-05-08',17);
INSERT INTO "Products" VALUES (1,1,1,'IMG_KS_195217.png','Кроссовки детские «Звёздочка» экокожа',1,'Кроссовки детские «Звёздочка» экокожа. Производитель: ООО «Малыш-Спорт», г. Смоленск','Верх — экокожа (полиуретан на хлопковой основе), подкладка — хлопок 100%, подошва — ПВХ',2190);
INSERT INTO "Products" VALUES (2,1,1,'IMG_KS_195213.png','Кроссовки детские «Гонщик» экокожа',2,'Кроссовки детские «Гонщик» экокожа. Производитель: Фабрика «Топ-Топ», г. Киров','Верх — экокожа (микрофибра), подкладка — текстиль сетчатый (полиэстер), подошва — термопластичная резина (ТЭП)',2490);
INSERT INTO "Products" VALUES (3,1,1,'IMG_KS_195222.png','Кроссовки детские «Радуга» экокожа перфорированная',3,'Кроссовки детские «Радуга» экокожа перфорированная. Производитель: ИП Смирнова Л.В. (бренд «Лапушка»), г. Вологда','Верх — экокожа перфорированная, вставки — нейлон, стелька — ортопедическая с латексной подушкой, подошва — ЭВА',1990);
INSERT INTO "Products" VALUES (4,1,2,'IMG_KB_185501.png','Сапожки детские «Снежинка» зимние на меху',4,'Сапожки детские «Снежинка» зимние на меху. Производитель: ООО «Тёплые ножки», г. Новосибирск','Верх — экокожа морозостойкая, утеплитель — искусственный мех (акрил 70%, полиэстер 30%), подкладка — флис, подошва — термоэластопласт (ТЭП)',3490);
INSERT INTO "Products" VALUES (5,1,2,'IMG_KB_164816.png','Сапожки детские «Медвежонок» демисезонные непромокаемые',5,'Сапожки детские «Медвежонок» демисезонные непромокаемые. Производитель: Компания «Северята», г. Архангельск','Верх — плащёвая ткань с водоотталкивающей пропиткой (полиэстер 100%), отделка — экокожа, подкладка — микрофибра, мембрана — AirTex, подошва — резина',3190);
INSERT INTO "Products" VALUES (6,1,2,'IMG_KB_164811.png','Сапожки детские «Принцесса» кожаные',6,'Сапожки детские «Принцесса» кожаные. Производитель: Мастерская «Весна», г. Тула','Верх — натуральная кожа (КРС), подкладка — шерсть натуральная (70%), байка (30%), стелька — войлочная, подошва — полиуретан',4290);
INSERT INTO "Products" VALUES (7,1,3,'IMG_KSd_195207.png','Сандалии детские «Пчёлка» ортопедические летние',7,'Сандалии детские «Пчёлка» ортопедические летние. Производитель: ООО «Здоровый шаг», г. Воронеж','Верх — нубук натуральный, подкладка — кожа растительного дубления, стелька — анатомическая с супинатором (латекс + пробка), подошва — каучук',2790);
INSERT INTO "Products" VALUES (8,1,3,'IMG_KSd_185508.png','Сандалии детские «Морячок» текстильные с фиксатором',8,'Сандалии детские «Морячок» текстильные с фиксатором. Производитель: ИП Кузнецов А.Д. (бренд «Карапуз»), г. Краснодар','Верх — джинсовая ткань (хлопок 100%), окантовка — искусственная кожа, подкладка — хлопок, подошва — ЭВА лёгкая',1690);
INSERT INTO "Products" VALUES (9,1,4,'IMG_KSho_185512.png','Туфли детские «Бантик» лаковые праздничные',9,'Туфли детские «Бантик» лаковые праздничные. Производитель: Дом обуви «Маленький франт», г. Москва','Верх — искусственная лаковая кожа (ПВХ), носок усиленный — термопластичный полиуретан, подкладка — кожа искусственная дышащая, стелька — анатомическая с амортизацией, подошва — полиуретан',2390);
INSERT INTO "Products" VALUES (10,2,2,'IMG_WB_170905.png','Сапоги зимние натуральная кожа',10,'Сапоги женские зимние, нескользящая, устойчивая подошва, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск','Верх — натуральная кожа, подкладка — евромех, натуральный мех, текстильный утеплитель, подошва — резина',25000);
INSERT INTO "Products" VALUES (11,2,2,'IMG_WB_170859.png','Сапоги осенние натуральная кожа',10,'Сапоги женские демисезонные из высококачественной натуральной кожи. Производитель: Дом обуви «Барбари», г. Новороссийск','Верх — натуральная кожа, подкладка — текстильный утеплитель, стелька — текстиль, подошва — ТПР',15000);
INSERT INTO "Products" VALUES (12,2,2,'IMG_WB_170906.png','Сапоги трубы демисезонные замшевые',11,'Сапоги женские демисезонные замшевые. Производитель: ОАО «Твой комфорт», г. Ярославль','Верх — натуральная замша, утепленные, тракторная подошва, стелька — байка, подошва — резина',17000);
INSERT INTO "Products" VALUES (13,2,3,'IMG_WSd_174332.png','Босоножки «Песчаный берег» коричневые',12,'Коричневая кожаная модель с открытым носком, боковой пряжкой и закрытым каблуком. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург','Верх — 100% козья кожа, подкладка — 100% кожа; подошва: 100% кожа',7500);
INSERT INTO "Products" VALUES (14,2,3,'IMG_WSd_185156.png','Женские босоножки «Черный кофе» со скульптурным каблуком',13,'Открытый носок и ремешок со сборной пряжкой, низкий каблук и резиновая подошва гарантируют комфорт. Производитель: ЗАО «Кожевенные традиции», г. Вятка','Верх — кожа собственного производств, подкладка — кожа; подошва: резина',5600);
INSERT INTO "Products" VALUES (15,2,3,'IMG_WSd_185551.png','Босоножки женские «Летний бриз»',14,'Босоножки женские кожаные белые, регулируемый ремешок, закрытый каблук и кожаная подошва. Производитель: ООО «Модный силуэт», г. Кострома','Верх — натуральная кожа, подкладка — натуральная кожа, подошва — кожа',7130);
INSERT INTO "Products" VALUES (16,2,4,'IMG_WSho_174409.png','Демисезонные туфли натуральная кожа',14,'Комфортные лаконичные лодочки, классический дизайна с современными акцентами. Производитель: ООО «Модный силуэт», г. Кострома','Верх — натуральная овечья кожа, подкладка и стелька — натуральная овечья кожа, подошва — резина',12340);
INSERT INTO "Products" VALUES (17,2,4,'IMG_WSho_185202.png','Туфли женские натуральная кожа с металлическими вставками',13,'Стильные туфли для весеннего и летнего сезона. Производитель: ЗАО «Кожевенные традиции», г. Вятка','Верх — натуральная телячьей кожа, металлическая пряжка, подкладка и стелька— натуральная овечья кожа, подошва — резина',7757);
INSERT INTO "Products" VALUES (18,2,4,'IMG_WSho_185545.png','Туфли классические лодочки натуральная кожа',12,'Модель из натуральной кожи, классический острый носок и изящная шпилька. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург','Верх — натуральная кожа, подкладка и стелька — натуральная кожа, подошва — тунит',7550);
INSERT INTO "Products" VALUES (19,2,1,'IMG_WS_174110.png','Кроссовки белые с оранжевым и красным',2,'Многослойный верх из кожи и текстиля. Производитель: Фабрика «Топ-Топ», г. Киров','Верх — 70% кожа, 30% текстиль, подкладка — текстиль, подошва — резина',9450);
INSERT INTO "Products" VALUES (20,2,1,'IMG_WS_185528.png','Кроссовки летние кожаные',2,'Уверенность на каждом шагу. Материал обеспечивает долговечность и комфорт при носке. Производитель: Фабрика «Топ-Топ», г. Киров','Верх — 87% кожа, 11% текстиль, 2% синтетика; подкладка: 100% текстиль; подошва: резина, пластик',8565);
INSERT INTO "Products" VALUES (21,2,1,'IMG_WS_185535.png','Кроссовки кожаные',12,'Кроссовки женские из натуральной кожи. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург','Верх — натуральная кожа, подкладка — кожа, подошва — полиуретан',8765);
INSERT INTO "Products" VALUES (22,2,1,'IMG_WS_185538.png','Кроссовки «Стиль и комфорт»',12,'Кроссовки женские из натуральной кожи и синтетических материалов, сетчатые вставки. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург','Верх — 70% кожа, 20% полиамид, 10% полиуретан; подкладка — текстиль, подошва — ТПУ',7795);
INSERT INTO "Products" VALUES (23,3,1,'IMG_MS_185531.png','Кроссовки для бега «Драйв»',15,'Сочетание стиля, комфорта и современных технологий. Производитель: Фабрика «Азимут», г. Санкт-Петербург','Верх —  сетка, подкладка — текстиль, подошва —  резина',6550);
INSERT INTO "Products" VALUES (24,3,1,'IMG_MS_185532.png','Кроссовки «Азимут Бег»',15,'Универсальный выбор для повседневного использования. Производитель: Фабрика «Азимут», г. Санкт-Петербург','Верх — 6% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина',7890);
INSERT INTO "Products" VALUES (25,3,1,'IMG_MS_185533.png','Кроссовки',2,'Кроссовки для мужчин, идеальное сочетание стиля и комфорта. Производитель: Фабрика «Топ-Топ», г. Киров','Верх — 56% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина',9567);
INSERT INTO "Products" VALUES (26,3,4,'IMG_MSho_190514.png','Черные туфли в классическом стиле — база для деловых образов',10,'Модель выполнена из натуральной кожи, на резиновой подошве. Производитель: Дом обуви «Барбари», г. Новороссийск','Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — резина',24569);
INSERT INTO "Products" VALUES (27,3,4,'IMG_MSho_190518.png','Туфли мужские светлые классика демисезонные',16,'Туфли на низком каблуке кожаные','Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — ТЭП',10155);
INSERT INTO "Products" VALUES (28,3,4,'IMG_MSho_191612.png','Туфли из натуральной кожи',16,'Модель выполнена из натуральной кожи, на резиновой подошве, поддеживает классический и деловой стиль образов. Производитель: Дом обуви «Берестов», г. Москва','Верх — натуральная кожа, подкладка — натуральная кожа, стелька — натуральная кожа, подошва — резина',25625);
INSERT INTO "Products" VALUES (29,3,5,'IMG_MB_174349.png','Ботинки мужские демисезонные',10,'Ботинки из натуральной кожи темно-коричневого и черного цвета на шнурках. Производитель: Дом обуви «Берестов», г. Москва','Верх — натуральная кожа, подкладка — текстиль, подошва — искусственный материал',21500);
INSERT INTO "Products" VALUES (30,3,5,'IMG_MB_191200.png','Ботинки черные из натуральной кожи',13,'Ботинки представляют баланс традиций и современности. Выполнены из натуральной кожи насыщенного черного цвета. Производитель: ЗАО «Кожевенные традиции», г. Вятка','Верх — натуральная кожа, подкладка — ворсин, стелька — ворсин, подошва — тунит',14567);
INSERT INTO "Products" VALUES (31,3,5,'IMG_MB_191205.png','Ботинки зимние классические',10,'Выбор на каждый день — натуральная кожа, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск','Верх — натуральная кожа, подкладка — натуральный мех, стелька — натуральный мех, подошва — ТЭП',15670);
INSERT INTO "Roles" VALUES (1,'Администратор');
INSERT INTO "Roles" VALUES (2,'Менеджер');
INSERT INTO "Roles" VALUES (3,'Авторизованный пользователь');
INSERT INTO "Sizes" VALUES (1,18.0);
INSERT INTO "Sizes" VALUES (2,19.0);
INSERT INTO "Sizes" VALUES (3,20.0);
INSERT INTO "Sizes" VALUES (4,21.0);
INSERT INTO "Sizes" VALUES (5,22.0);
INSERT INTO "Sizes" VALUES (6,23.0);
INSERT INTO "Sizes" VALUES (7,24.0);
INSERT INTO "Sizes" VALUES (8,25.0);
INSERT INTO "Sizes" VALUES (9,26.0);
INSERT INTO "Sizes" VALUES (10,27.0);
INSERT INTO "Sizes" VALUES (11,28.0);
INSERT INTO "Sizes" VALUES (12,29.0);
INSERT INTO "Sizes" VALUES (13,30.0);
INSERT INTO "Sizes" VALUES (14,31.0);
INSERT INTO "Sizes" VALUES (15,32.0);
INSERT INTO "Sizes" VALUES (16,33.0);
INSERT INTO "Sizes" VALUES (17,34.0);
INSERT INTO "Sizes" VALUES (18,35.0);
INSERT INTO "Sizes" VALUES (19,36.0);
INSERT INTO "Sizes" VALUES (20,36.5);
INSERT INTO "Sizes" VALUES (21,37.0);
INSERT INTO "Sizes" VALUES (22,37.5);
INSERT INTO "Sizes" VALUES (23,38.0);
INSERT INTO "Sizes" VALUES (24,38.5);
INSERT INTO "Sizes" VALUES (25,39.0);
INSERT INTO "Sizes" VALUES (26,39.5);
INSERT INTO "Sizes" VALUES (27,40.0);
INSERT INTO "Sizes" VALUES (28,40.5);
INSERT INTO "Sizes" VALUES (29,41.0);
INSERT INTO "Sizes" VALUES (30,41.5);
INSERT INTO "Sizes" VALUES (31,42.0);
INSERT INTO "Sizes" VALUES (32,42.5);
INSERT INTO "Sizes" VALUES (33,43.0);
INSERT INTO "Sizes" VALUES (34,44.0);
INSERT INTO "Sizes" VALUES (35,45.0);
INSERT INTO "StockItems" VALUES (1,1,3,20);
INSERT INTO "StockItems" VALUES (2,1,4,20);
INSERT INTO "StockItems" VALUES (3,1,5,20);
INSERT INTO "StockItems" VALUES (4,1,6,20);
INSERT INTO "StockItems" VALUES (5,1,7,20);
INSERT INTO "StockItems" VALUES (6,1,8,20);
INSERT INTO "StockItems" VALUES (7,2,16,2);
INSERT INTO "StockItems" VALUES (8,2,17,2);
INSERT INTO "StockItems" VALUES (9,3,2,30);
INSERT INTO "StockItems" VALUES (10,3,3,30);
INSERT INTO "StockItems" VALUES (11,4,2,15);
INSERT INTO "StockItems" VALUES (12,4,3,15);
INSERT INTO "StockItems" VALUES (13,5,4,5);
INSERT INTO "StockItems" VALUES (14,5,5,5);
INSERT INTO "StockItems" VALUES (15,5,6,5);
INSERT INTO "StockItems" VALUES (16,6,1,4);
INSERT INTO "StockItems" VALUES (17,6,2,4);
INSERT INTO "StockItems" VALUES (18,6,3,4);
INSERT INTO "StockItems" VALUES (19,7,4,4);
INSERT INTO "StockItems" VALUES (20,7,5,4);
INSERT INTO "StockItems" VALUES (21,7,6,4);
INSERT INTO "StockItems" VALUES (22,7,7,4);
INSERT INTO "StockItems" VALUES (23,8,10,7);
INSERT INTO "StockItems" VALUES (24,8,11,7);
INSERT INTO "StockItems" VALUES (25,8,12,7);
INSERT INTO "StockItems" VALUES (26,8,13,7);
INSERT INTO "StockItems" VALUES (27,9,1,7);
INSERT INTO "StockItems" VALUES (28,9,2,7);
INSERT INTO "StockItems" VALUES (29,9,3,7);
INSERT INTO "StockItems" VALUES (30,10,19,12);
INSERT INTO "StockItems" VALUES (31,10,21,12);
INSERT INTO "StockItems" VALUES (32,11,25,2);
INSERT INTO "StockItems" VALUES (33,11,27,2);
INSERT INTO "StockItems" VALUES (34,12,21,5);
INSERT INTO "StockItems" VALUES (35,12,25,5);
INSERT INTO "StockItems" VALUES (36,12,27,5);
INSERT INTO "StockItems" VALUES (37,13,19,10);
INSERT INTO "StockItems" VALUES (38,13,21,10);
INSERT INTO "StockItems" VALUES (39,13,23,10);
INSERT INTO "StockItems" VALUES (40,13,25,10);
INSERT INTO "StockItems" VALUES (41,13,27,10);
INSERT INTO "StockItems" VALUES (42,14,18,3);
INSERT INTO "StockItems" VALUES (43,15,21,23);
INSERT INTO "StockItems" VALUES (44,15,25,23);
INSERT INTO "StockItems" VALUES (45,15,27,23);
INSERT INTO "StockItems" VALUES (46,16,19,25);
INSERT INTO "StockItems" VALUES (47,16,21,25);
INSERT INTO "StockItems" VALUES (48,16,23,25);
INSERT INTO "StockItems" VALUES (49,17,19,4);
INSERT INTO "StockItems" VALUES (50,17,23,4);
INSERT INTO "StockItems" VALUES (51,17,25,4);
INSERT INTO "StockItems" VALUES (52,17,27,4);
INSERT INTO "StockItems" VALUES (53,18,18,9);
INSERT INTO "StockItems" VALUES (54,18,23,9);
INSERT INTO "StockItems" VALUES (55,19,18,2);
INSERT INTO "StockItems" VALUES (56,19,19,2);
INSERT INTO "StockItems" VALUES (57,20,21,5);
INSERT INTO "StockItems" VALUES (58,20,22,5);
INSERT INTO "StockItems" VALUES (59,20,23,5);
INSERT INTO "StockItems" VALUES (60,20,24,5);
INSERT INTO "StockItems" VALUES (61,21,18,16);
INSERT INTO "StockItems" VALUES (62,21,19,16);
INSERT INTO "StockItems" VALUES (63,21,23,16);
INSERT INTO "StockItems" VALUES (64,21,25,16);
INSERT INTO "StockItems" VALUES (65,22,18,3);
INSERT INTO "StockItems" VALUES (66,22,23,3);
INSERT INTO "StockItems" VALUES (67,23,30,18);
INSERT INTO "StockItems" VALUES (68,23,31,18);
INSERT INTO "StockItems" VALUES (69,23,32,18);
INSERT INTO "StockItems" VALUES (70,23,33,18);
INSERT INTO "StockItems" VALUES (71,24,23,50);
INSERT INTO "StockItems" VALUES (72,24,24,50);
INSERT INTO "StockItems" VALUES (73,24,25,50);
INSERT INTO "StockItems" VALUES (74,24,26,50);
INSERT INTO "StockItems" VALUES (75,24,27,50);
INSERT INTO "StockItems" VALUES (76,24,29,50);
INSERT INTO "StockItems" VALUES (77,25,29,3);
INSERT INTO "StockItems" VALUES (78,25,31,3);
INSERT INTO "StockItems" VALUES (79,25,34,3);
INSERT INTO "StockItems" VALUES (80,26,27,23);
INSERT INTO "StockItems" VALUES (81,26,29,23);
INSERT INTO "StockItems" VALUES (82,26,33,23);
INSERT INTO "StockItems" VALUES (83,27,31,15);
INSERT INTO "StockItems" VALUES (84,27,33,15);
INSERT INTO "StockItems" VALUES (85,27,34,15);
INSERT INTO "StockItems" VALUES (86,28,34,3);
INSERT INTO "StockItems" VALUES (87,29,29,1);
INSERT INTO "StockItems" VALUES (88,29,31,1);
INSERT INTO "StockItems" VALUES (89,30,31,20);
INSERT INTO "StockItems" VALUES (90,30,33,20);
INSERT INTO "StockItems" VALUES (91,31,29,30);
INSERT INTO "StockItems" VALUES (92,31,31,30);
INSERT INTO "SubCategories" VALUES (1,'Кроссовки');
INSERT INTO "SubCategories" VALUES (2,'Сапоги');
INSERT INTO "SubCategories" VALUES (3,'Босоножки');
INSERT INTO "SubCategories" VALUES (4,'Туфли');
INSERT INTO "SubCategories" VALUES (5,'Ботинки');
INSERT INTO "Users" VALUES (1,'Иванов','Иван','Сергеевич','isivanov',1);
INSERT INTO "Users" VALUES (2,'Петров','Пётр','Алексеевич','papetrov',2);
INSERT INTO "Users" VALUES (3,'Сидорова','Анна','Дмитриевна','asidorova',3);
INSERT INTO "Users" VALUES (4,'Кузнецова','Екатерина','Андреевна','ekuznetsova',2);
INSERT INTO "Users" VALUES (5,'Смирнов','Дмитрий','Владимирович','dsmirnov',3);
INSERT INTO "Users" VALUES (6,'Попов','Алексей','Николаевич','apopov',1);
INSERT INTO "Users" VALUES (7,'Васильева','Ольга','Игоревна','ovasileva',3);
INSERT INTO "Users" VALUES (8,'Соколов','Павел','Викторович','psokolov',2);
INSERT INTO "Users" VALUES (9,'Михайлова','Татьяна','Юрьевна','tmikhailova',3);
INSERT INTO "Users" VALUES (10,'Новикова','Наталья','Сергеевна','nnovikova',2);
INSERT INTO "Users" VALUES (11,'Фёдоров','Андрей','Максимович','afedorov',1);
INSERT INTO "Users" VALUES (12,'Морозов','Сергей','Павлович','smorozov',3);
INSERT INTO "Users" VALUES (13,'Волкова','Юлия','Александровна','jvolkova',2);
INSERT INTO "Users" VALUES (14,'Алексеев','Артём','Евгеньевич','aalekseev',3);
INSERT INTO "Users" VALUES (15,'Лебедева','Ирина','Владимировна','ilebedeva',3);
INSERT INTO "Users" VALUES (16,'Егоров','Никита','Денисович','negorov',2);
INSERT INTO "Users" VALUES (17,'Павлова','Елена','Петровна','epavlova',3);
INSERT INTO "Users" VALUES (18,'Козлов','Роман','Олегович','rkozlov',1);
INSERT INTO "Users" VALUES (19,'Степанова','Виктория','Романовна','vstepanova',2);
INSERT INTO "Users" VALUES (20,'Николаев','Владимир','Иванович','vnikolaev',3);
COMMIT;
