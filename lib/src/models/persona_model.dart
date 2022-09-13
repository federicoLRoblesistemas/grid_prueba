import 'package:equatable/equatable.dart';

class PersonaModel extends Equatable {
  const PersonaModel({
    this.id = '',
    this.nombre = '',    
    this.edad = '',
    this.rol = '',
    this.inicio = '',
    this.hora = '',
  });

  final String id;
  final String nombre;
  final String edad;
  final String rol;
  final String inicio;
  final String hora;

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "edad": edad,
    "rol": rol,
    "inicio": inicio,
    "hora": hora,    
  };  

  @override
  List<Object?> get props => [nombre, id, edad,rol ,inicio,hora];
}
