part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}


class GetAllProductLoadingState extends HomeState {}
class GetAllProductSucessState extends HomeState {}
class GetAllProductErrorState extends HomeState {}
