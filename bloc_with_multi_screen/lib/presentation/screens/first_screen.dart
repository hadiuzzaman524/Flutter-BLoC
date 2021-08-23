import 'package:bloc_with_multi_screen/business_logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.isPlush){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Increment: ${state.counter}")));
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Decrement: ${state.counter}")));
          }
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    "${state.counter}",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.minimize),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(color: Colors.red, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Go to Second Page",
                    style: TextStyle(color: Colors.white),),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
