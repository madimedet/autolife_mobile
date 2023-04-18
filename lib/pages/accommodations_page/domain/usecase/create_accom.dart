import 'package:autolife_application_3/pages/accommodations_page/data/model/accomm_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/card_entity.dart';
import '../repositories/accom_repo.dart';

class CreateAccom implements UseCase<AccommodationsModel, CreateAccommParams> {
  late final AccommRepository accomrepository;

  CreateAccom (this.accomrepository);

  @override
  Future<Either<Failure, AccommodationsModel>> call(CreateAccommParams params) async {
    return await accomrepository.postCreateCard(params);
  }  
}
class CreateAccommParams extends Equatable { 
  final String nameAccoms;
  const CreateAccommParams({required this.nameAccoms});

  @override
  List<Object> get props => [nameAccoms];
}