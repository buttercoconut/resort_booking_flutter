import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/models/resort.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:resort_booking_flutter/routes.dart';

class ResortList extends StatelessWidget {
  final List<Resort> resorts;

  const ResortList({Key? key, required this.resorts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resorts.length,
      itemBuilder: (context, index) {
        final resort = resorts[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: resort.images.first,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(resort.name),
            subtitle: Text('\$${resort.pricePerNight.toStringAsFixed(2)} per night'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.detail,
                arguments: resort.id,
              );
            },
          ),
        );
      },
    );
  }
}
