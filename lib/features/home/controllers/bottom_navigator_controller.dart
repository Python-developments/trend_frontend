import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';


part 'bottom_navigator_controller.g.dart';

@injectable
class BottomNavigatorController extends BottomNavigatorControllerBase
    with _$BottomNavigatorController {
  BottomNavigatorController(@factoryParam super.index);
}

abstract class BottomNavigatorControllerBase with Store {
  final int index;
  BottomNavigatorControllerBase( this.index){
    currentIndex=index;
  }

  @observable
   late int currentIndex;

  @action
  void changeIndex(final int newIndex) {
    currentIndex = newIndex;
  }
}
