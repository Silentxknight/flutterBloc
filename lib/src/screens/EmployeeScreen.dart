import 'package:flutter/material.dart';
import 'package:bloc_arc/src/model/Employee.dart';
import 'package:bloc_arc/src/bloc/EmployeeBloc.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({ Key? key }) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();
  
  @override
  void dispose(){
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Employee>>(
         stream:  _employeeBloc.employeeListStream,
       builder:(BuildContext context,AsyncSnapshot<List<Employee>> snapshot)
        {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context,index){
                return Card(elevation: 5.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text("${snapshot.data![index].id}",
                      style: TextStyle(fontSize: 20.0),),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${snapshot.data![index].name}",
                          style: TextStyle(fontSize: 18.0),),
                           Text("₹ ${snapshot.data![index].salary}",
                          style: TextStyle(fontSize: 16.0),),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(icon:Icon(Icons.thumb_up),color: Colors.green,onPressed: (){
                        print(snapshot.data![index]);
                        
                        _employeeBloc.employeeSalaryIncrement.add(snapshot.data![index]);
                        print('Incremented!');
                      },),
                    ),
                    Container(
                      child: IconButton(icon:Icon(Icons.thumb_down),color: Colors.red,onPressed: (){
                          print(snapshot.data![index]);
                         _employeeBloc.employeeSalaryDecrement.add(snapshot.data![index]);
                         print('Decremented!');
                      },),
                    )
                  ],
                ),);
          });
        }
      ),
    );
  }
}