import 'package:ezi18n/ezi18n.dart';

class AppMessages implements EzMessages {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'app_title': 'Flutter Demo',
          'counter_message': 'You have pushed the button @{count} times',
          'increment': 'Increment',
          'select_language': 'Select a language'
        },
        'pt': {
          'app_title': 'Demonstração do Flutter',
          'counter_message': 'Você pressionou o botão @{count} vezes',
          'increment': 'Incrementar',
          'select_language': 'Selecione a linguagem'
        },
        'pt_BR': {
          'app_title': 'Demonstração do Flutter',
          'counter_message': 'Você pressionou o botão @{count} vezes, malandro',
          'increment': 'Incrementar',
          'select_language': 'Selecione a linguagem'
        },
      };
}
