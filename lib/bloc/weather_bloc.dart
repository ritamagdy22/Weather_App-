
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weatherApp/data/data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        WeatherFactory wf = WeatherFactory(Api_Key, language: Language.ENGLISH);
      //  Position position = await Geolocator.getCurrentPosition();

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
            event.position.longitude);

print(weather);
        emit(WeatherSucess(weather));
      } catch (e) {
        emit(WeatherFailed());
      }
    });
  }
}
