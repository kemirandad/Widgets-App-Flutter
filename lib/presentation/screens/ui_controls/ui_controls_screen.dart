import 'package:flutter/material.dart';

class UiControlsScreen extends StatefulWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  State<UiControlsScreen> createState() => _UiControlsScreenState();
}

enum Transportation {car, plane, boat, submarine}

class _UiControlsScreenState extends State<UiControlsScreen> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SwitchListTile(
            value: isDeveloper, 
            title: const Text('Developer Mode'), 
            subtitle: const Text('Habilitar/deshabilitar modo desarrollador'),
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
          ExpansionTile(
            leading: selectedTransportation == Transportation.car
                    ? const Icon(Icons.car_rental_outlined, color: Colors.green)
                    : selectedTransportation == Transportation.boat
                      ? const Icon ( Icons.sailing, color: Colors.green)
                      : selectedTransportation == Transportation.plane
                        ? const Icon ( Icons.airplanemode_active, color: Colors.green)
                        : const Icon ( Icons.directions_boat, color: Colors.green,),
            title: const Text('Vehiculo de transporte'),
            subtitle: const Text('Seleccione el tipo de transporte'),
            children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              }),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              }),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              }),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              }),
            ],
            ),

          CheckboxListTile(
            title: const Text('¿Desayuno?'),
            value: wantsBreakfast,
            onChanged: (value) {
              setState(() {
                wantsBreakfast = !wantsBreakfast;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('¿Almuerzo?'),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('¿Cena?'),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            },
          ),
        ]
      ),
    );
  }
}
