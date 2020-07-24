import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Start up view'),),
        floatingActionButton: FloatingActionButton(onPressed: () => model.natiiveToHome(), child: Icon(Icons.add),),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
