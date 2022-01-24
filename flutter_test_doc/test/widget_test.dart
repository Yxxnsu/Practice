// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('General Class', () async {
    var value = PizzaType.HamMushroom;
    Pizza pizza;
    switch (value) {
      case PizzaType.HamMushroom:
        pizza = HamMushroomPizza();
        break;

      case PizzaType.Deluxe:
        pizza = DeluxePizza();
        break;

      case PizzaType.Seafood:
        pizza = SeafoodPizza();
        break;
      default:
        pizza = SeafoodPizza();
        break;
    }
    print(pizza.getPrice());
  });
}

enum PizzaType { HamMushroom, Deluxe, Seafood }

abstract class Pizza {
  double getPrice();
}

class HamMushroomPizza implements Pizza {
  double price = 10.3;
  @override
  double getPrice() {
    return price;
  }
}

class DeluxePizza implements Pizza {
  double price = 14.6;
  @override
  double getPrice() {
    return price;
  }
}

class SeafoodPizza implements Pizza {
  double price = 15.3;
  double getPrice() {
    return price;
  }
}
