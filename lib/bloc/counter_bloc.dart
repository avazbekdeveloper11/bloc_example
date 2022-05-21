import 'dart:async';
part 'counter_event.dart';

class CounterBloc {
  int _count = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  //?
  Stream<int> get counter => _counterStateController.stream;
  //?
  final _counterEventController = StreamController<CounterEvent>();
  //*
  Sink<CounterEvent> get CounterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(
      (event) {
        if (event is IncrementEvent)
          _count++;
        else
          _count--;

        _inCounter.add(_count);
      },
    );
  }

  void dispose() {
    _counterEventController.close();
    _counterEventController.close();
  }
}
