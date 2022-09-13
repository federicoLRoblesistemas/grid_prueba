import 'package:flutter/material.dart';
import 'package:grid_pluto/src/utils/lista_personas_utils.dart';

import 'package:pluto_grid/pluto_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id Usuario',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Nombre',
      field: 'nombre',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Edad',
      field: 'edad',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Rol',
      field: 'rol',
      type: PlutoColumnType.select(<String>[
        'Programador',
        'Diseñador',
        'Dueño',
      ]),
    ),
    PlutoColumn(
      title: 'Inicio',
      field: 'inicio',
      type: PlutoColumnType.date(),
    ),
    PlutoColumn(
      title: 'Horario',
      field: 'hora',
      type: PlutoColumnType.time(),
    ),
  ];

  final List<PlutoRow> rows = [
    ...ListaPersonasUtils.listaPersonas.map(
      (e) => PlutoRow(
        cells: {
          'id': PlutoCell(value: e.id),
          'nombre': PlutoCell(value: e.nombre),
          'edad': PlutoCell(value: e.edad),
          'rol': PlutoCell(value: e.rol),
          'inicio': PlutoCell(value: e.inicio),
          'hora': PlutoCell(value: e.hora),
        },
      ),
    )
  ];

  /// columnGroups se pueden agrupar columnas se pueden omitir..
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'Informacion Usuario', fields: ['nombre', 'edad']),
    PlutoColumnGroup(title: 'Estatus', children: [
      PlutoColumnGroup(title: 'A', fields: ['rol'], expandedColumn: true),
      PlutoColumnGroup(title: 'Datos Laborales', fields: ['inicio', 'hora']),
    ]),
  ];

  /// [PlutoGridStateManager] tiene muchos métodos y propiedades para manipular dinámicamente la cuadrícula.
  /// Puede manipular la cuadrícula dinámicamente en tiempo de ejecución pasándola a través de la devolución de llamada [onLoaded].
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: PlutoGrid(
          columns: columns,
          rows: rows,
          columnGroups: columnGroups,
          onLoaded: (PlutoGridOnLoadedEvent event) {
            stateManager = event.stateManager;
          },
          onChanged: (PlutoGridOnChangedEvent event) {
            //aca puedo acceder al valor de la primer columna de la fila
            print(rows[event.rowIdx!].cells.entries.first.value.value);

            //valor que se le pasa a la celda
            print(event.value);
          },
          configuration: const PlutoGridConfiguration(),
        ),
      ),
    );
  }
}
