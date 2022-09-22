import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
//https://img.myloview.com.br/posters/grupo-de-criancas-com-caras-felizes-cubos-abc-criancas-dos-desenhos-animados-ceu-azul-e-natureza-cartaz-de-vetores-planos-para-terapia-de-fala-centro-de-desenvolvimento-infantil-ou-jardim-de-infa-400-111865982.jpg
void main() => runApp(AppWight());

class AppWight extends StatelessWidget {
  const AppWight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.isLight
                ? Brightness.light
                : Brightness.dark,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => NivelOne(),
            '/two': (context) => NivelTwo(),
          },
        );
      },
    ));
  }
}

class NivelOne extends StatefulWidget {
  const NivelOne({Key? key}) : super(key: key);

  @override
  State<NivelOne> createState() => _NivelOneState();
}

class _NivelOneState extends State<NivelOne> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Nivel 1"),
        leading: Icon(Icons.route),
        actions: <Widget>[
           Padding(
            padding: EdgeInsets.only(right:25),
            child:
              Row(children:[
                TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              child: const Text('HomePage'),
              ),
             TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              child: const Text('Login'),
              ),
              ])
          ),
        ],
      ),
      //body
      body:
      Column(children:[
        Container(child:
          Text('Adivinhe', style: TextStyle( fontSize: 20),)
        ),
        Container(height: 200, width:200, child:
          Image.network('https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg'),
        ),
        Center(heightFactor: 4,child:
          Column(
 
            children:[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(child: Text('Resposta 1'), 
                 onPressed: () => Navigator.pushNamed(context, '/two')
              ),
              TextButton(child: Text('Resposta 2'), onPressed:(){}),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Resposta erra'),
                      content: const Text('Que pena, tente novamente'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                   style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 10,
                    shadowColor: Colors.white70,
                  ),
                  child: const Text('Resposta 3'),
                ),
              TextButton(child: Text('Resposta 4'), onPressed:(){}),
            ]),
          ]),
        ),
      ]),
    );
  }
}

class NivelTwo extends StatefulWidget {
  const NivelTwo({Key? key}) : super(key: key);

  @override
  State<NivelTwo> createState() => _NivelTwoState();
}

class _NivelTwoState extends State<NivelTwo> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Nivel 2"),
        leading: Icon(Icons.route),
        actions: <Widget>[
           Padding(
            padding: EdgeInsets.only(right:25),
            child:
              Row(children:[
                TextButton(
                onPressed: () {
                  
                },
              child: const Text('HomePage'),
              ),
             TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              child: const Text('Login'),
              ),
              ])
          ),
        ],
      ),
      //body
      body:
      Column(children:[
        Container(child:
          Text('Adivinhe', style: TextStyle( fontSize: 26),)
        ),
        Container(height: 300, width:300, child:
          Image.network('https://st.depositphotos.com/1018728/2685/i/600/depositphotos_26855515-stock-photo-horse-running-during-sunset-with.jpg'),
        ),
        Center(heightFactor: 2,child:
          Column(
            children:[
            Padding(padding: EdgeInsets.only(bottom: 16.0),child:
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(right: 16.0),child:
                        TextButton(style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 10,
                        shadowColor: Colors.white70,
                      ),child: Text('Resposta 1'), onPressed:(){}),
                 ),
                
              TextButton(style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 10,
                shadowColor: Colors.white70,
              ),
                child: Text('Resposta 2'), onPressed:(){}),
            ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(child: Text('Resposta 3'), onPressed:(){}),
              TextButton(child: Text('Resposta 4'), onPressed:(){}),
            ]),
          ]),
        ),
      ]),
    );
  }
}



class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isLight = false;

  changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Switch(
        value: AppController.instance.isLight,
        onChanged: (value) {
          AppController.instance.changeTheme();
        }));
  }
}
