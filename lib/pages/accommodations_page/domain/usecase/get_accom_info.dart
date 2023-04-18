import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/accomm_model.dart';
import '../entities/card_entity.dart';
import '../repositories/accom_repo.dart';

class GetAccomInfo implements UseCase<List<AccommodationsModel>, NoParams> {
  late final AccommRepository accomrepository;

  GetAccomInfo(this.accomrepository);

  @override
  Future<Either<Failure, List<AccommodationsModel>>> call(NoParams params) async {
    return await accomrepository.getAccomInfo();
  }
}

class TokenParams extends Equatable {
  final String token;
  const TokenParams({required this.token});

  @override
  List<Object> get props => [];
}
