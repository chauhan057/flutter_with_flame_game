import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame {
  late MyComponent myComponent;
  late MyTestParent myParent1, myParent2;

  @override
  Color backgroundColor() => const Color(0xff222222);

  @override
  void onMount() {
    add(myParent1= MyTestParent());
    add(myParent2= MyTestParent());
    myComponent = MyComponent();  // Initialize myComponent
    // add(myComponent);             // Add it to the game
    myTestFunction();
    super.onMount();
  }

  void myTestFunction() async {
    myParent1.add(myComponent);
    await Future.delayed(Duration(seconds: 1));
    myParent1.remove(myComponent);
    await Future.delayed(Duration(seconds: 1));
    myParent2.add(myComponent);
    await Future.delayed(Duration(seconds: 1));
    myParent2.remove(myComponent);
  }
}

class MyTestParent extends Component {

}

class MyComponent extends Component {
  @override
  void onLoad() {
    print("MyComponent.onLoad()");
    super.onLoad();
  }

  @override
  void onMount() {
    print("MyComponent.onMount()");
    super.onMount();
  }

  @override
  void onRemove() {
    print("MyComponent.onRemove()");
    super.onRemove();
  }
}
