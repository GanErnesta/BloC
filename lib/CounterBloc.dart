import 'package:bloc/bloc.dart';


enum CounterEvent { increment, decrement }
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {    //Events merupakan masukkan (input) pada Bloc. Events biasanya 
                                          //dieksekusi ketika adanya interaksi pengguna seperti menekan tombol.
      switch (event) {
        case CounterEvent.decrement:    //State merupakan keluaran (output) pada Bloc. State merupakan
          emit(state - 1);                //hasil dari proses yang dilakukan pada Bloc.
          break;
        case CounterEvent.increment:    //emit yang berisi penambahan nilai pada state. 
          emit(state + 1);
          break;
      }
    });
  }

  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
  