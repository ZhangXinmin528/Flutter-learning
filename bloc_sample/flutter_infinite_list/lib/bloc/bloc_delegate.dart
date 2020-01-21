import 'package:bloc/bloc.dart';

///自定义BlocDelegate来监测用户交互和状态改变。
///需要在main()定义：BlocSupervisor.delegate = SimpleBlocDelegate();
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
