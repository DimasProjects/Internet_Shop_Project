from django.db import models


class User(models.Model):
    idUser = models.IntegerField(primary_key=True)
    cUserName = models.CharField(max_length=45)
    cUserPassword = models.CharField(max_length=45)
    cUserSurname = models.CharField(max_length=45)
    cUserPhoneNumber = models.CharField(max_length=45)
    cUserMail = models.EmailField(max_length=45)


class Category(models.Model):
    idCategory = models.IntegerField(primary_key=True)
    cCategoryDesc = models.CharField(max_length=45)


class Goods(models.Model):
    idGood = models.IntegerField(primary_key=True)
    category = models.ForeignKey(Category)
    cGoodName = models.CharField(max_length=45)
    cGoodModel = models.CharField(max_length=45)
    cGoodDescription = models.TextField(max_length=100)


class Status(models.Model):
    cStatus = models.CharField(primary_key=True)
    dOrdered = models.DateTimeField()


class OrderInSystem(models.Model):
    idOrder = models.IntegerField(primary_key=True)
    cOrderDescription = models.TextField(max_length=100)
    status = models.ForeignKey(Status)
    idUser = models.ForeignKey(User)
    idCategory = models.ForeignKey(Category)
    dCost = models.DecimalField(max_digits=5, decimal_places=2)


class OrderToCustomer(models.Model):
    idOrderToCustomer = models.IntegerField(primary_key=True)
    order = models.ForeignKey(OrderInSystem)
    guarantee = models.ForeignKey(Guarantee)


class Guarantee(models.Model):
    idGuarantee = models.IntegerField(primary_key=True)
    iDurationDays = models.IntegerField()
    dDateStartGuarantee = models.DateTimeField()
    dDateEndGuarantee = models.DateTimeField()
    tConditions = models.TextField(max_length=150)  # the conditions of Guarantee
