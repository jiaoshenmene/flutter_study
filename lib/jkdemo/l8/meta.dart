class Meta {
  double price;
  String name;

  Meta(this.name, this.price);
}

//定义商品Item类
class Item extends Meta {
  Item(name, price) : super(name, price);

  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

abstract class PrintHelper {
  printInfo() => print(getInfo());

  getInfo();

  pringPaper() => print(getPaper);

  getPaper();
}

//定义购物车类
class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String code;
  List<Item> bookings;

  double get price =>
      bookings.reduce((value, element) => value + element).price;

  ShoppingCart({name}) : this.withCode(name: name, code: null);

  ShoppingCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  @override
  getInfo() => '''
  购物车信息:
  -----------------------------
  用户名: $name
  优惠码: $code
  总价:   $price
  日期:   $date
  -----------------------------
  ''';

  @override
  getPaper() {
    // TODO: implement getPaper
    return null;
  }


}

void main() {
  ShoppingCart.withCode(name: '张三', code: '123456')
    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();

  ShoppingCart.withCode(name: '李四')
    ..bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)]
    ..printInfo();
}
