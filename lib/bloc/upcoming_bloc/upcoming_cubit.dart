import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp2/model/movie.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
part 'upcoming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit({required this.repository})
      : super(const UpComingState.loading());

  final MovieRepository repository;

  Future<void> fetchUpComing() async {
    try {
      final movie = await repository.getUpComing();
      emit(UpComingState.success(movie));
    } on Exception {
      emit(const UpComingState.failure());
    }
  }
}