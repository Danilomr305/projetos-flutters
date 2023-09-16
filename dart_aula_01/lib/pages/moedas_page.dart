import 'package:dart_aula_01/configs/app_settings.dart';
import 'package:dart_aula_01/models/moeda.dart';
import 'package:dart_aula_01/pages/moedas_detalhes_page.dart';
import 'package:dart_aula_01/repositories/favoritas_repository.dart';
import 'package:dart_aula_01/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  late NumberFormat real;
  late Map<String, String> loc;
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  readNumberFormat() {
    loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(
      locale: loc['locale'],
      name: loc['name']
    );
  }

  changeLanguageButton() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    // ignore: unused_local_variable
    final name = loc[locale] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      icon: const Icon(Icons.language_outlined),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.swap_vert_circle_outlined),
            title: Text('Usar $locale'),
            onTap: () {
              context.read<AppSettings>().setLocale(locale, name);
              Navigator.pop(context);
            },
          )
        )
      ]
    );
  }
  
  appBarDinamica() {
    if(selecionadas.isEmpty) {
      return AppBar(
        title: const Text(
          'Cripto Moedas',
          style:
          TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22.0
          ),
        ),
        actions: [
          changeLanguageButton(),
        ],
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            setState( () {
              selecionadas = [];
            });
          },
        ),
        title: Text('${selecionadas.length} selecionadas'),
        backgroundColor: Colors.blueGrey.shade100,
        
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w900
        ),
      );
    }
  }

  mostrarDetalhes(Moeda moeda){
    Navigator.push(context, 
    MaterialPageRoute(
       builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  LimparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    favoritas = context.watch<FavoritasRepository>();
    readNumberFormat();

    // ignore: unused_local_variable
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12),
              ),
            ),
            // ignore: sort_child_properties_last
            leading: 
            (selecionadas.contains(tabela[moeda]))
              ? const CircleAvatar(
                child: Icon(Icons.check),
              )
            : SizedBox(
              // ignore: sort_child_properties_last
              child: Image.asset(tabela[moeda].icone),
              width: 50,
              ),
              title: Row(
                children: [
                  Text(
                    tabela[moeda].nome, 
                  style: const 
                    TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (favoritas.lista.any((fav) => fav.sigla == tabela[moeda].sigla))  
                    const Icon(Icons.circle, color: Colors.amber, size: 8,)
                ],
              ),
            trailing: 
            Text(
              real.format(tabela[moeda].preco
              ),
            ),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo,
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda]))
                    ? selecionadas.remove(tabela[moeda])
                    : selecionadas.add(tabela[moeda]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[moeda]),
          );
        }, 
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, ___) => const Divider(), 
        itemCount: tabela.length
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty ?
      FloatingActionButton.extended(
        onPressed: () {
          favoritas.saveAll(selecionadas);
          LimparSelecionadas();
        }, 
        icon: const Icon(Icons.star_border_outlined),
        label: const Text(
          'FAVORITAR',
          style: TextStyle(
            letterSpacing: 0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ) 
      : null,
    );
  }
}