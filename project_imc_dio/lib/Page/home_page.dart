import 'package:project_imc_dio/import.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightControler = TextEditingController(text: "");
  TextEditingController heightControler = TextEditingController(text: "");
  var bmiRepository = BMIRepository();
  var _bmi = <Bmi>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bmi = bmiRepository.getBmi();
  }

  Widget titleTextt(text) {
    return Text(text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget normalText(text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            titleTextt(
              'BMI Calculator',
            ),
            SizedBox(
              height: 10,
            ),
            normalText(
              'Click on the button to calculate your BMI',
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        'Calculate BMI',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'Weight',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: weightControler,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'Height',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: heightControler,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print(weightControler.text);
                                print(heightControler.text);

                                try {
                                  var weight =
                                      double.parse(weightControler.text);
                                  var height =
                                      double.parse(heightControler.text);
                                  setState(() {
                                    var bmi = Bmi(weight, height);
                                    bmiRepository.addBmi(bmi);
                                  });
                                  Navigator.pop(context);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Isert only numbers in the fields')));
                                  ;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade200),
                              child: Text(
                                'Finish',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200),
              child: Text(
                'Calculate',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _bmi.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var item = _bmi[index];
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 1, bottom: 10),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your classificationn was ${item.getClassification(item.getBmi(item.height, item.weight))}!',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'BMI | ${item.getBmi(item.height, item.weight).toStringAsFixed(2)}!',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'Height: ${item.height} | Weight ${item.weight}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
