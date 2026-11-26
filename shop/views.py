from django.shortcuts import render, redirect
from .models import Products, Users, Orders

def main_view(request):
    products = Products.objects.all()
    return render(request, "main.html", {"products": products})

def login_view(request):
    if request.method == "POST":
        login = request.POST.get('login')
        user = Users.objects.filter(login=login).first()
        if user:
            request.session['user_id'] = user.userid
            request.session['role_id'] = user.roleid_id
            return redirect('main')
        else:
            return render(request, "login.html", {"error": "Пользователь не найден"})
    return render(request, "login.html")


def logout_view(request):
    request.session.flush()
    return redirect('login')

def managers_order_view(request):
    if request.session.get('role_id') not in [1, 2]:
        return render('main')
    
    orders = Orders.objects.all()
    return render(request, "manager_order.html", {"orders": orders})
