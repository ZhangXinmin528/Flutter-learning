import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer_bloc_component.dart';
import 'package:flutter_timer/ticker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'CountDownTimer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) {
          return TimerBloc(ticker: Ticker());
        },
        child: Timer(title: appTitle),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  final String title;
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  Timer({@required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Center(
                    child: BlocBuilder<TimerBloc, TimerState>(
                      builder: (context, state) {
                        final String minutesStr = ((state.duration / 60) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        final String sendsStr = (state.duration % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        return Text(
                          '$minutesStr:$sendsStr',
                          style: timerTextStyle,
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    return Actions();
                  },
                  condition: (previousState, state) {
                    return state.runtimeType != previousState.runtimeType;
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateTOActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateTOActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    if (currentState is Ready) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(Start(duration: currentState.duration));
          },
          child: Icon(Icons.play_arrow),
        )
      ];
    }
    if (currentState is Running) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(Pause());
          },
          child: Icon(Icons.pause),
        ),
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }
    if (currentState is Paused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            timerBloc.add(Resume());
          },
        ),
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }

    if (currentState is Finished) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }

    return [];
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(184, 189, 245, 0.7),
          ],
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(172, 182, 219, 0.7),
          ],
          [
            Color.fromRGBO(72, 73, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(190, 238, 246, 0.7),
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 25,
      backgroundColor: Colors.blue[50],
    );
  }
}
