import 'dart:async';

import 'package:room_check/bloc/bloc.dart';

class HomeButtonBloc implements Bloc {

  int _percent = 0;

  final StreamController<int> _controllerPercent = StreamController();


  void onTap(){
    if (_percent + 10 <= 100){
      _percent += 10;
      _controllerPercent.sink.add(_percent);
    }
  }

  Stream<int> get percentStream => _controllerPercent.stream;

  @override
  void dispose() {
    _controllerPercent.close();
  }
}