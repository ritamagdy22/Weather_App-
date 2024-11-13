part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}



final class WeatherFailed extends WeatherState {}

final class WeatherSucess extends WeatherState {


final Weather weather ;

const WeatherSucess (this.weather);
// equtable and comparing 2 objects while whether is changeing and something dynamic 
  List<Object> get props => [weather];


}