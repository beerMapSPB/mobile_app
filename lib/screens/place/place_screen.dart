import 'package:flutter/material.dart';
import 'package:mobile_app/entity/place.dart';
import 'package:mobile_app/entity/places.dart';
import 'package:mobile_app/screens/place_list/controls/externals_app_widget.dart';

import 'controls/adress.dart';
import 'controls/communication.dart';
import 'controls/description.dart';
import 'controls/hours.dart';
import 'controls/interior.dart';
import 'controls/main_header.dart';
import 'controls/map.dart';
import 'controls/place_rating.dart';

class PlacePageWidget extends StatefulWidget {
  final int placeId;
  final List<Place> _places = placesForTestes;

  PlacePageWidget({Key? key, required this.placeId}) : super(key: key);

  @override
  State<PlacePageWidget> createState() => _PlacePageWidgetState();
}

class _PlacePageWidgetState extends State<PlacePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget._places[widget.placeId].name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ListView(
          children: [
            InteriorWidget(imgPath: widget._places[widget.placeId].interior),
            HeaderWidget(text: 'Тип: ${widget._places[widget.placeId].type}'),
            PlaceRatingWidget(rate: widget._places[widget.placeId].rate),
            HeaderWidget(text: 'Описание'),
            DescriptionWidget(
                description: widget._places[widget.placeId].description),
            HeaderWidget(text: 'Адрес'),
            AdressWidget(adress: widget._places[widget.placeId].adress),
            HeaderWidget(text: 'Контакты'),
            CommunicationWidget(
                phone: widget._places[widget.placeId].externalLinks.phone),
            HeaderWidget(text: 'Социальные сети'),
            ExternalAppsWidget(
              instagram: widget._places[widget.placeId].externalLinks.instagram,
              vk: widget._places[widget.placeId].externalLinks.vk,
              web: widget._places[widget.placeId].externalLinks.web,
              telegram: widget._places[widget.placeId].externalLinks.telegram,
            ),
            HeaderWidget(text: 'Время работы'),
            HoursWidget(),
            HeaderWidget(text: 'Расположение'),
            MapWidget()
          ],
        ),
      ),
    );
  }
}
