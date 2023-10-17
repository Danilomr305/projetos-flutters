// ignore_for_file: public_member_api_docs, sort_constructors_first, curly_braces_in_flow_control_structures
import 'package:cripto_moeda/configs/app_settings.dart';
import 'package:cripto_moeda/repositories/moeda_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/moeda.dart';

// ignore: must_be_immutable
class GraficoHistorico extends StatefulWidget {
  Moeda moeda;
  GraficoHistorico({
    Key? key,
    required this.moeda,
  }) : super(key: key);

  @override
  State<GraficoHistorico> createState() => _GraficoHistoricoState();
}

enum Periodo {hora, dia, semana, mes, ano, total}

class _GraficoHistoricoState extends State<GraficoHistorico> {

  List<Color> cores = [
    const Color(0xFF3F51B5),
  ];
  Periodo periodo = Periodo.hora;
  List<Map<String, dynamic>> historico = [];
  List dadosCompletos = [];
  List<FlSpot> dadosGraficos = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;
  ValueNotifier<bool> loaded = ValueNotifier(false);
  late MoedaRepository repositorio;
  late Map<String, String> loc;
  late NumberFormat real;

  setDados() async {
    loaded.value = false;
    dadosGraficos = [];

    if(historico.isEmpty) 
      historico = await repositorio.getHistoricoMoeda(widget.moeda);

      dadosCompletos = historico[periodo.index]['prices'];
      dadosCompletos = dadosCompletos.reversed.map((item) {
        double preco = double.parse(item[0]);
        // ignore: prefer_interpolation_to_compose_strings
        int time = int.parse(item[1].toString() + '000');
        return [preco, DateTime.fromMillisecondsSinceEpoch(time)];
      }).toList();

      maxX = dadosCompletos.length.toDouble();
      maxY = 0;
      minY = double.infinity;

      for (var item in dadosCompletos) {
        maxY = item[0] > maxY ? item[0] : maxY;
        minY = item[0] < minY ? item[0] : minY;
      }

      for (int i = 0; i < dadosCompletos.length; i++) {
        dadosGraficos.add(FlSpot(
          i.toDouble(), 
          dadosCompletos[i][0],
          ),
        );
      }
      loaded.value = true;
    }

    LineChartData getChardData() {
      return LineChartData(
        gridData:  FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),

        minX: 0,
        maxX: maxX,
        minY: minY,
        maxY: maxY,

        lineBarsData: [
          LineChartBarData(
            spots: dadosGraficos,
            isCurved: true,
            colors: cores,
            barWidth: 2,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: true,
            colors: cores.map((color) => color.withOpacity(0.15)).toList(),
            ),
          )
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    repositorio = context.read<MoedaRepository>();
    loc = context.read<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
    setDados();

    // ignore: avoid_unnecessary_containers
    return Container(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: loaded, 
              builder: (context, bool isLoaded, _) {
                return (isLoaded)
                ? LineChart(
                  getChardData(),
                )
                : const Center(
                  child: CircularProgressIndicator(),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}