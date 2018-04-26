import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Internationalization',
			theme: new ThemeData(
				primarySwatch: Colors.blue,
			),
			home: new MyHomePage(title: 'Internationalization'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	DateFormat dateFormat;
	DateFormat timeFormat;

	@override
	void initState() {
		super.initState();
		initializeDateFormatting();
		dateFormat = new DateFormat.yMMMMd('tr_TR');
		timeFormat = new DateFormat.Hms('tr_TR');
	}

	void _refresh() {
		setState(() {});
	}

	@override
	Widget build(BuildContext context) {
		var dateTime = new DateTime.now();
		return new Scaffold(
			appBar: new AppBar(
				title: new Text(widget.title),
				backgroundColor: Colors.pinkAccent,
			),
			body: new Center(
				child: new Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						new Text(dateFormat.format(dateTime),
							style: new TextStyle(
								fontSize: 24.0,
								fontWeight: FontWeight.bold,
									color: Colors.pinkAccent,
							),
						),
						new Text(timeFormat.format(dateTime),
							style: new TextStyle(
								fontSize: 22.0,
									fontWeight: FontWeight.bold
							),
						),
					],
				),
			),
			floatingActionButton: new FloatingActionButton(
				onPressed: _refresh,
				tooltip: 'Refresh',
				child: new Icon(Icons.refresh),
			),
		);
	}
}