import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_bloc_event.dart';
part 'list_bloc_state.dart';

class ListBlocBloc extends Bloc<ListBlocEvent, ListBlocState> {
  ListBlocBloc() : super(ListBlocInitial()) {
    on<ListBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
