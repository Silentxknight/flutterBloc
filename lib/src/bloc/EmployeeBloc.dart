//TODO imports

//TODO List of employees
//TODO Stream controllers

//TODO Stream Sink getter

//TODO Constructor - add data; listen to changes

//TODO Core functions

//TODO dispose

import 'dart:async';
import 'package:bloc_arc/src/model/Employee.dart';

class EmployeeBloc{

  //sink to add in pipe
  //stream to get data from pipe
  //by pipe i mean data flow


  final List<Employee> _employeeList = [
    Employee(1,'Eompyee One',3000.0),
    Employee(2,'Eompyee Two',9000.0),
    Employee(3,'Eompyee Five',10000.0),
    Employee(4,'Eompyee Four',18000.0),
  ];

  final _employeeListStreamContoller = StreamController<List<Employee>>();

  // for increment and decrement 
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //getters

  Stream<List<Employee>> get employeeListStream =>_employeeListStreamContoller.stream;
  StreamSink<List<Employee>> get employeeListSink =>_employeeListStreamContoller.sink;  
  StreamSink<Employee> get employeeSalaryIncrement =>_employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>_employeeSalaryDecrementStreamController.sink;


  //constructors
  EmployeeBloc(){
    _employeeListStreamContoller.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee emp){
    print(emp);
    double salary = emp.salary;
    double incrementedSalary = salary *20/100;
    incrementedSalary=incrementedSalary.roundToDouble();
    _employeeList[emp.id-1].salary= (salary+incrementedSalary);
    _employeeList[emp.id-1].salary= _employeeList[emp.id-1].salary ;
    employeeListSink.add(_employeeList);
  }
  _decrementSalary(Employee emp){
    print(emp);
    double salary = emp.salary;
    double decrementedSalary = salary *20/100;
    _employeeList[emp.id-1].salary= salary-decrementedSalary;
    employeeListSink.add(_employeeList);
  }



  void dispose(){
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeListStreamContoller.close();
  }
}