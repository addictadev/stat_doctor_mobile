import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/options/data/enums/option_type.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/options/data/repository/options_repository.dart';

part 'options_state.dart';

class OptionsCubit extends Cubit<OptionsState> {
  final OptionsRepository optionsRepository;
  OptionsCubit({required this.optionsRepository}) : super(OptionsInitial());

  List<Options> medicalOptions = [];
  List<Options> skillOptions = [];
  List<Options> specialtiesOptions = [];
  List<Options> seniorityOptions = [];
  List<Options> primaryDocumentOptions = [];
  List<Options> otherDocumentOptions = [];

  Future<void> getAllOptions() async { 
    await getMedicalOptions();
    await getSkillOptions();
    await getSpecialtiesOptions();
    await getSeniorityOptions();
    await getPrimaryDocumentOptions();
    await getOtherDocumentOptions();
  }

  Future<void> getMedicalOptions() async { 
    emit(MedicalOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.medical);
    result.fold(
      (failure) => emit(MedicalOptionsFailure(message: failure.message)),
      (success) {
        medicalOptions.clear();
        medicalOptions.addAll(success);
        emit(MedicalOptionsLoaded(options: success));
      },
    );
  }

  Future<void> getSkillOptions() async { 
    emit(SkillOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.skill);
    result.fold(
      (failure) => emit(SkillOptionsFailure(message: failure.message)),
      (success) {
        skillOptions.clear();
        skillOptions.addAll(success);
        emit(SkillOptionsLoaded(options: success));
      },
    );
  }

  Future<void> getSpecialtiesOptions() async { 
    emit(SpecialtiesOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.specialties);
    result.fold(
      (failure) => emit(SpecialtiesOptionsFailure(message: failure.message)),
      (success) {
        specialtiesOptions.clear();
        specialtiesOptions.addAll(success);
        emit(SpecialtiesOptionsLoaded(options: success));
      },
    );
  }

  Future<void> getSeniorityOptions() async { 
    emit(SeniorityOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.seniority);
    result.fold(
      (failure) => emit(SeniorityOptionsFailure(message: failure.message)),
      (success) {
        seniorityOptions.clear();
        seniorityOptions.addAll(success);
        emit(SeniorityOptionsLoaded(options: success));
      },
    );
  }

  Future<void> getPrimaryDocumentOptions() async { 
    emit(PrimaryDocumentOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.primaryDocument);
    result.fold(
      (failure) => emit(PrimaryDocumentOptionsFailure(message: failure.message)),
      (success) {
        primaryDocumentOptions.clear();
        primaryDocumentOptions.addAll(success);
        emit(PrimaryDocumentOptionsLoaded(options: success));
      },
    );
  }

  Future<void> getOtherDocumentOptions() async { 
    emit(OtherDocumentOptionsLoading());
    final result = await optionsRepository.getOptions(type: OptionType.otherDocument);
    result.fold(
      (failure) => emit(OtherDocumentOptionsFailure(message: failure.message)),
      (success) {
        otherDocumentOptions.clear();
        otherDocumentOptions.addAll(success);
        emit(OtherDocumentOptionsLoaded(options: success));
      },
    );
  }
}
