from django.contrib import admin
from .models import Users, Orders, Orderpositions, Products, Categories, Factories, Sizes, Stockitems, Roles, Subcategories


class OrderPositionsInline(admin.TabularInline):
    model = Orderpositions
    extra = 1


@admin.register(Orders)
class OrdersAdmin(admin.ModelAdmin):
    list_display = ('orderid', 'orderdate', 'userid')
    inlines = [OrderPositionsInline]


@admin.register(Users)
class UserAdmin(admin.ModelAdmin):
    list_display = ('secondname', 'firstname', 'middlename', 'login', 'roleid')


admin.site.register([Products, Categories, Factories, Sizes, Stockitems, Roles, Subcategories])