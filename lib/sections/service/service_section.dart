import 'package:flutter/material.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/models/Service.dart';

import 'components/service_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Color(0xFFFF0000),
            title: "Service Offerings",
            subTitle: "My Strong Arenas",
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.95,
            child: Center(
              child: Wrap(
                spacing: 20,
                children: List.generate(
                  services.length,
                      (index) => Container(
                      constraints: BoxConstraints(maxHeight: 400, minHeight: 100,
                          maxWidth:250, minWidth: 175),
                      child: ServiceCard(index: index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
