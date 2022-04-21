import 'package:ericui/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ui extends StatefulWidget {
  @override
  _UiState createState() => _UiState();
}

class _UiState extends State<Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Overall',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_drop_down),
              color: Colors.grey,
              onPressed: () {}),
          // action button
          IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.grey,
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, top: 7),
            elevation: 5,
            shadowColor: Colors.white,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'TOTAL BALANCE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Text(
                    ' & 855',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3, right: 3, top: 7),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          margin: EdgeInsets.only(left: 4, right: 14),
                          elevation: 5,
                          shadowColor: Colors.white,
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 166,
                                height: 60,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 105, top: 14, right: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green[100],
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_downward,
                                      ),
                                      onPressed: () => {
                                        BlocProvider.of<CounterCubit>(context)
                                            .increment()
                                        //context.bloc<CounterCubit>().decrement()
                                      },
                                      iconSize: 30,
                                      color: Colors.green[400],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 166,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 57),
                                          height: 25,
                                          child: Text(
                                            'TOTAL INCOME',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 75),
                                          height: 25,
                                          child: BlocConsumer<CounterCubit,
                                              CounterState>(
                                            listener: (context, state) {
                                              if (state.wasIncremented ==
                                                  true) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        Text('Incremented'),
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                  ),
                                                );
                                              }
                                            },
                                            builder: (context, state) {
                                              return Text(
                                                state.counterValue.toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(right: 4),
                          elevation: 5,
                          shadowColor: Colors.white,
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 166,
                                height: 60,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 105, top: 14, right: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red[100],
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_upward,
                                      ),
                                      iconSize: 30,
                                      onPressed: () => {
                                        BlocProvider.of<CounterCubit>(context)
                                            .decrement()
                                      },
                                      color: Colors.red[400],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                width: 166,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 50),
                                        height: 25,
                                        child: Text(
                                          'TOTAL EXPENSE',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 80),
                                        height: 25,
                                        child: BlocConsumer<CounterCubit,
                                            CounterState>(
                                          listener: (context, state) {
                                            if (state.wasIncremented == false) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text('Decremented'),
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                ),
                                              );
                                            }
                                          },
                                          builder: (context, state) {
                                            return Text(
                                              state.counterValue.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, top: 7),
            elevation: 5,
            shadowColor: Colors.white,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: 115,
                      width: 120,
                      child: Card(
                        margin: EdgeInsets.only(left: 20, top: 18, bottom: 18),
                        elevation: 5,
                        shadowColor: Colors.white,
                        color: Colors.grey[100],
                        child: IconButton(
                            icon: Icon(Icons.emoji_transportation_outlined),
                            iconSize: 40,
                            color: Colors.black87,
                            onPressed: () {}),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 57.5,
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: Text(
                              'sent',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 57.5,
                          width: 110,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              'Transportation',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 115,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, top: 50),
                        child: Text(
                          '- & 5,288',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, top: 7),
            elevation: 5,
            shadowColor: Colors.white,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Card(
                        margin: EdgeInsets.only(left: 20, top: 18, bottom: 18),
                        elevation: 5,
                        shadowColor: Colors.white,
                        color: Colors.grey[100],
                        child: IconButton(
                            icon: Icon(Icons.account_balance_outlined),
                            iconSize: 40,
                            color: Colors.black87,
                            onPressed: () {}),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 57.5,
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: Text(
                              'deposit',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 57.5,
                          width: 110,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              'Insurance',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 120,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, top: 50),
                        child: Text(
                          '- & 588',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, top: 7),
            elevation: 5,
            shadowColor: Colors.white,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Card(
                        margin: EdgeInsets.only(left: 20, top: 18, bottom: 18),
                        elevation: 5,
                        shadowColor: Colors.white,
                        color: Colors.grey[100],
                        child: IconButton(
                            icon: Icon(Icons.spa_outlined),
                            iconSize: 40,
                            color: Colors.black87,
                            onPressed: () {}),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 57.5,
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: Text(
                              'payment',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 57.5,
                          width: 110,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              'Utilities',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 115,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, top: 50),
                        child: Text(
                          '- & 5,288',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
