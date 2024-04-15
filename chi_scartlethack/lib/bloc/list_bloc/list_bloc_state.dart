part of 'list_bloc_bloc.dart';

abstract class ListBlocState extends Equatable {
  const ListBlocState();
  
  @override
  List<Object> get props => [];
}

class ListBlocInitial extends ListBlocState {}
