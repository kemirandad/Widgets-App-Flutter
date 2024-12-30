import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final IconData icon;
  final String route;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.icon,
      required this.route});
}

const menuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      icon: Icons.smart_button_outlined,
      route: '/buttons'),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      icon: Icons.credit_card,
      route: '/cards'),
  MenuItems(
      title: 'Indicadores de progreso',
      subTitle: 'Generales y Controlados',
      icon: Icons.refresh_outlined,
      route: '/progress'),
  MenuItems(
      title: 'Snackbars y diálogos',
      subTitle: 'Indicadores en pantalla',
      icon: Icons.info_outline,
      route: '/snackbar'),
  MenuItems(
      title: 'Container animado',
      subTitle: 'Stateful Widget animado',
      icon: Icons.check_box_outline_blank_rounded,
      route: '/animated'),
  MenuItems(
      title: 'UI Controls + Tiles',
      subTitle: 'Una serie de Controles en Flutter',
      icon: Icons.car_rental_outlined,
      route: '/ui-controls'),
  MenuItems(
      title: 'Introducción a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      icon: Icons.accessibility_rounded,
      route: '/tutorial'),
  MenuItems(
      title: 'Infinite Scroll and Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      icon: Icons.list_alt_rounded,
      route: '/infinite'),
];
