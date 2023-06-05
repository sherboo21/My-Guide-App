import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

// Get My Profile State //

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {
  final dynamic data;

  const GetProfileSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class GetProfileErrorState extends ProfileState {
  final String messageError;

  const GetProfileErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

// Update My Profile State //

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {
  final dynamic data;

  const UpdateProfileSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class UpdateProfileValidateState extends ProfileState {
  final String messageError;

  const UpdateProfileValidateState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

class UpdateProfileErrorState extends ProfileState {
  final String messageError;

  const UpdateProfileErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
