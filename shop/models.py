# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from datetime import date, timedelta


class Categories(models.Model):
    categoryid = models.AutoField(db_column='CategoryID', primary_key=True)  # Field name made lowercase.
    category = models.TextField(db_column='Category', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Categories'
    
    def __str__(self):
        return self.category


class Factories(models.Model):
    factoryid = models.AutoField(db_column='FactoryID', primary_key=True)  # Field name made lowercase.
    factory = models.TextField(db_column='Factory', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Factories'

    def __str__(self):
        return self.factory


class Orderpositions(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    orderid = models.ForeignKey('Orders', models.DO_NOTHING, db_column='OrderID', blank=True, null=True)  # Field name made lowercase.
    productid = models.ForeignKey('Products', models.DO_NOTHING, db_column='ProductID', blank=True, null=True)  # Field name made lowercase.
    sizeid = models.ForeignKey('Sizes', models.DO_NOTHING, db_column='SizeID', blank=True, null=True)  # Field name made lowercase.
    amount = models.IntegerField(db_column='Amount', blank=True, null=True)  # Field name made lowercase.
    priceperunit = models.IntegerField(db_column='PricePerUnit', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'OrderPositions'
        
    def __str__(self):
        return f"{self.productid}, Размер: {self.sizeid}"


class Orders(models.Model):
    orderid = models.AutoField(db_column='OrderID', primary_key=True)  # Field name made lowercase.
    orderdate = models.TextField(db_column='OrderDate', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='UserID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Orders'
    def __str__(self):
        return f"Заказ №: {self.orderid}"


class Products(models.Model):
    productid = models.AutoField(db_column='ProductID', primary_key=True)  # Field name made lowercase.
    categoryid = models.ForeignKey(Categories, models.DO_NOTHING, db_column='CategoryID', blank=True, null=True)  # Field name made lowercase.
    subcategoryid = models.ForeignKey('Subcategories', models.DO_NOTHING, db_column='SubCategoryID', blank=True, null=True)  # Field name made lowercase.
    img = models.TextField(db_column='Img', blank=True, null=True)  # Field name made lowercase.
    productname = models.TextField(db_column='ProductName', blank=True, null=True)  # Field name made lowercase.
    factoryid = models.ForeignKey(Factories, models.DO_NOTHING, db_column='FactoryID', blank=True, null=True)  # Field name made lowercase.
    description = models.TextField(db_column='Description', blank=True, null=True)  # Field name made lowercase.
    composition = models.TextField(db_column='Composition', blank=True, null=True)  # Field name made lowercase.
    price = models.IntegerField(db_column='Price', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Products'
     
    @property
    def count(self):
        count = 0
        for si in self.stockitems_set.all():
            count += si.availiable
        return count
    
    @property
    def count_as_word(self):
        if self.count > 5:
            return "Много"
        return "Мало"
    
    @property
    def bg_color(self):
        if self.count <= 3:
            return "#FF8080"
        return ""

    @property
    def discounted_price(self):
        return round(self.price * 0.75)
    
    @property
    def has_prev_month_orders(self):
        prev_month = (date.today().replace(day=1) - timedelta(days=1)).strftime('%Y-%m')
        return Orderpositions.objects.filter(productid=self, orderid__orderdate__startswith=prev_month).exists()


class Roles(models.Model):
    roleid = models.AutoField(db_column='RoleID', primary_key=True)  # Field name made lowercase.
    role = models.TextField(db_column='Role', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Roles'


class Sizes(models.Model):
    sizeid = models.AutoField(db_column='SizeID', primary_key=True)  # Field name made lowercase.
    size = models.FloatField(db_column='Size', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Sizes'
    
    def __str__(self):
        return str(self.size)


class Stockitems(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    productid = models.ForeignKey(Products, models.DO_NOTHING, db_column='ProductID', blank=True, null=True)  # Field name made lowercase.
    sizeid = models.ForeignKey(Sizes, models.DO_NOTHING, db_column='SizeID', blank=True, null=True)  # Field name made lowercase.
    availiable = models.IntegerField(db_column='Availiable', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'StockItems'
    
    def __str__(self):
        return f"{self.productid} — Размер {self.sizeid} ({self.availiable} шт.)"



class Subcategories(models.Model):
    subcategoryid = models.AutoField(db_column='SubCategoryID', primary_key=True)  # Field name made lowercase.
    subcategory = models.TextField(db_column='SubCategory', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SubCategories'


class Users(models.Model):
    userid = models.AutoField(db_column='UserID', primary_key=True)  # Field name made lowercase.
    middlename = models.TextField(db_column='MiddleName', blank=True, null=True)  # Field name made lowercase.
    firstname = models.TextField(db_column='FirstName', blank=True, null=True)  # Field name made lowercase.
    secondname = models.TextField(db_column='SecondName', blank=True, null=True)  # Field name made lowercase.
    login = models.TextField(db_column='Login', blank=True, null=True)  # Field name made lowercase.
    roleid = models.ForeignKey(Roles, models.DO_NOTHING, db_column='RoleID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Users'
    
    def __str__(self):
        return f"{self.firstname} {self.middlename} {self.secondname}"
