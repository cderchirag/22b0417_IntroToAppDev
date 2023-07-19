import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Myapp(),
));

class Myapp extends StatefulWidget {



  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  int total=48700;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar:AppBar(
        leading: BackButton(onPressed: () {}),
        title:
        Text("Budget Tracker",
        style: TextStyle(fontSize: 30,
          color: Colors.black
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,

      ),
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Icon(Icons.account_circle_rounded,
          size: 150,
          color: Colors.black,),
          SizedBox(height: 20),
          Text(
            "WELCOME",
            style: TextStyle(

              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
          ),
            SizedBox(height: 20),
            Text(
              "BACK!",
              style: TextStyle(

                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.fromLTRB(3, 13, 3, 13),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              color: Colors.blueAccent[100],
              child: Text(
                'Total                           $total',
                style: TextStyle(
                  fontSize: 30,

                ),
              ),
            ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100], // Set the box color to white
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    categories[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpenseScreen(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
          ],//children
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddExpenseDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Colors.purpleAccent,
      body:
      ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent[100], // Set the box color to white
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(
                expenses[index].name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                expenses[index].amount.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddExpenseDialog(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}



class AddExpenseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Expense',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Expense Value',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Logic to save the expense
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent, // Set the button's background color to blueAccent
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.purpleAccent,
    );
  }
}



    List<String> categories = ['Groceries                                 -300',
      'Bills                                        -1000',
      'Salary                                 +50000'];

    class Expense {
    final String name;
    final double amount;

    Expense({required this.name, required this.amount});
    }

    List<Expense> expenses = [
    Expense(name: 'Expense 1', amount: 100),
    Expense(name: 'Expense 2', amount: 100),
    Expense(name: 'Expense 3', amount: 100),
    ];