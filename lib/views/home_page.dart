import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/data_bloc.dart';
import 'package:news_app/bloc/data_event.dart';
import 'package:news_app/bloc/data_state.dart';
import 'package:news_app/models/data_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorsInitialState state = DoctorsInitialState();

    return BlocProvider(
      create: (BuildContext context) => DoctorsBloc(state),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<DoctorsBloc>(context);
    newsBloc!.add(FetchPostEvent());
  }

  DoctorsBloc? newsBloc;

  Widget _savedList(List<Result> lists) {
    return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(15),
            elevation: 7,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            lists[index].firstName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  mainUI(List<DoctorsModel> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(),
          );
        });
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: RaisedButton(
                color: const Color(0xFFfcb917),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  newsBloc!.add(FetchPostEvent());
                },
                child: const Text(
                  "Refresh",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("LATEST NEWS"),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                newsBloc!.add(FetchPostEvent());
              })
        ],
      ),
      body: BlocListener<DoctorsBloc, DoctorsStates>(
        listener: (context, state) {},
        child: BlocBuilder<DoctorsBloc, DoctorsStates>(
          builder: (context, state) {
            if (state is DoctorsInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorsLoadedState) {
              return _savedList(state.doctorsModel.result);
            } else if (state is DoctorsErrorState) {
              return buildErrorUi("Error");
            } else {
              return buildErrorUi("Error");
            }
          },
        ),
      ),
    );
  }
}
