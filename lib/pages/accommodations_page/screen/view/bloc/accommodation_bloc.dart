import 'package:autolife_application_3/pages/accommodations_page/domain/usecase/create_accom.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../data/model/accomm_model.dart';
import '../../../domain/usecase/get_accom_info.dart';


part 'accommodation_event.dart';
part 'accommodation_state.dart';

class AccommodationBloc extends Bloc<AccommodationEvent, AccommodationState> {
  final GetAccomInfo accomInfo;
  final CreateAccom createdata;
  AccommodationBloc(this.accomInfo, this.createdata) : super(AccommodationInitial()) {
    on<AccommodationEvent>((event, emit)async {
     if(event is GetInfoAccommEvent){      
     try{ print("Get AllAccomList");
      emit(AccommodationLoadingState());
      final accomList = await accomInfo(NoParams());
      accomList.fold((error) {
        print("error State allAccomList $error");
        emit(AccommodationLoadingErrorState(message: error.toString()));
      },(accomList){
        print("AccomLoading Success State $accomList");
        emit(AccommodationLoadingSuccessState(accommodation: accomList));
      }
        
      );
}on DioError catch(e){
 print('errorState $e');
   emit(AccommodationLoadingErrorState(message: e.toString()));

}catch(e){
  print('errorState $e');
   emit(AccommodationLoadingErrorState(message: e.toString()));
}
     }
     if(event is CreateAccommEvent){
      try {
        print("CREATING ACCOMMODATION");
        emit(CreatingAccomState());
        final createAccom = await createdata(CreateAccommParams(nameAccoms: event.name ));
        createAccom.fold((error) {
            print("CREATING ACCOM ERRORSTATE ${error}");
            emit(CreatingAccomErrorState(message: error.toString()));

        },(createAccom){
          print("CREATING ACCOM SUCCESS STATE ${createAccom}");
          emit(CreatingAccomSuccessState(accommodation: createAccom));
        }
        );
      } on DioError catch (e) {
          print('errorState $e');
          emit(CreatingAccomErrorState(message: e.toString()));
        } catch (e) {
           print('errorState $e');
          emit(CreatingAccomErrorState(message: e.toString()));
        }
     }
    });
  }
}
