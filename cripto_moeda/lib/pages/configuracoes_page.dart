import 'package:cripto_moeda/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../configs/app_settings.dart';
import '../repositories/conta_repository.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   final conta = context.watch<ContaRepository>();
   final loc = context.read<AppSettings>().locale;
   // ignore: unused_local_variable
   NumberFormat real = 
   NumberFormat.currency(locale: loc['Locale'], name: loc['name']);

   return Scaffold(
    appBar: AppBar(
      title: const Text('Configuraçãos'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ListTile(
            title: const Text('Saldo'),
            subtitle: Text(
              real.format(conta.saldo),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.indigoAccent
              ),
            ),
            trailing: IconButton(
              onPressed: udpateSaldo,
              icon: const Icon(Icons.edit)
            ),
          ),
          const  Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: OutlinedButton(
              onPressed: () => context.read<AuthService>().logout(),
              style: OutlinedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.red
              ), 
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sair do App',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
            ), 
          ),
        ],
      ),
    ),
   );
  }
   udpateSaldo() async {
    final form = GlobalKey<FormState>();
    final valor = TextEditingController();
    final conta = context.read<ContaRepository>();
    
    valor.text = conta.saldo.toString();

    AlertDialog dialog = AlertDialog(
      title: const Text('Atualizar o Saldo'),
      content: Form(
        key: form,
        child: TextFormField( 
          controller: valor,
          keyboardType: TextInputType.number,
          inputFormatters: [ 
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')
            ),
          ],
          validator: (value) {
            if(value!.isEmpty) return 'Informe o valor do saldo';
            return null;
          },
        )
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), child: const Text('CANCELAR')
        ),
        TextButton(
          onPressed: () {
            if (form.currentState!.validate()) {
              conta.setSaldo(double.parse(valor.text));
              Navigator.pop(context);
            }
          },
          child: const Text('SALVAR'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}