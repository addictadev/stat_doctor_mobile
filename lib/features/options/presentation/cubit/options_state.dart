part of 'options_cubit.dart';

sealed class OptionsState extends Equatable {
  const OptionsState();

  @override
  List<Object> get props => [];
}

final class OptionsInitial extends OptionsState {}

// Medical Options States
final class MedicalOptionsLoading extends OptionsState {}

final class MedicalOptionsLoaded extends OptionsState {
  final List<Options> options;
  const MedicalOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class MedicalOptionsFailure extends OptionsState {
  final String message;
  const MedicalOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// Skill Options States
final class SkillOptionsLoading extends OptionsState {}

final class SkillOptionsLoaded extends OptionsState {
  final List<Options> options;
  const SkillOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class SkillOptionsFailure extends OptionsState {
  final String message;
  const SkillOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// Specialties Options States
final class SpecialtiesOptionsLoading extends OptionsState {}

final class SpecialtiesOptionsLoaded extends OptionsState {
  final List<Options> options;
  const SpecialtiesOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class SpecialtiesOptionsFailure extends OptionsState {
  final String message;
  const SpecialtiesOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// Seniority Options States
final class SeniorityOptionsLoading extends OptionsState {}

final class SeniorityOptionsLoaded extends OptionsState {
  final List<Options> options;
  const SeniorityOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class SeniorityOptionsFailure extends OptionsState {
  final String message;
  const SeniorityOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// Primary Document Options States
final class PrimaryDocumentOptionsLoading extends OptionsState {}

final class PrimaryDocumentOptionsLoaded extends OptionsState {
  final List<Options> options;
  const PrimaryDocumentOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class PrimaryDocumentOptionsFailure extends OptionsState {
  final String message;
  const PrimaryDocumentOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// Other Document Options States
final class OtherDocumentOptionsLoading extends OptionsState {}

final class OtherDocumentOptionsLoaded extends OptionsState {
  final List<Options> options;
  const OtherDocumentOptionsLoaded({required this.options});
  @override
  List<Object> get props => [options];
}

final class OtherDocumentOptionsFailure extends OptionsState {
  final String message;
  const OtherDocumentOptionsFailure({required this.message});
  @override
  List<Object> get props => [message];
}


