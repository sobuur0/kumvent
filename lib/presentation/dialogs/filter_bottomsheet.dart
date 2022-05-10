import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/models/states.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? firstValue = 'Abia';
  RangeValues _filterPriceRange = const RangeValues(0.0, 700.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      padding: const EdgeInsets.fromLTRB(18.0, 8.0, 15.0, 48.0),
      child: ListView(
        children: [
          const Center(
            child: SizedBox(
              width: 85.0,
              child: Divider(
                color: kFilterBottomSheetDividerColor,
                thickness: 3.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          Center(
            child: Text(
              'Filter',
              style: TextStyles.bold(
                color: kTextPrimaryColor,
                fontSize: 18.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            'Location',
            style: TextStyles.medium(
              color: kFilterBottomSheetLabelColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 18.0)),
          DropdownButtonFormField(
            value: firstValue,
            menuMaxHeight: 300.0,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            items: states.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                firstValue = newValue;
              });
            },
            style: TextStyles.regular(
              color: const Color(0xFF636262),
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(8.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xFFC4C4C4),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kErrorColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            'Price Range',
            style: TextStyles.medium(
              color: kFilterBottomSheetLabelColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15.0)),
          RangeSlider(
            min: 0.0,
            max: 700.0,
            values: _filterPriceRange,
            divisions: 7,
            inactiveColor: const Color(0xFF7E9BFF),
            activeColor: const Color(0xFF0D34BF),
            labels: RangeLabels(
              _filterPriceRange.start.round().toString(),
              _filterPriceRange.end.round().toString(),
            ),
            onChanged: (RangeValues newValue) {
              setState(() {
                _filterPriceRange = newValue;
              });
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 6.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Minimum',
                style: TextStyles.bold(
                  color: kNotificationCheckText,
                  fontSize: 12.0,
                ),
              ),
              Text(
                'Maximum',
                style: TextStyles.bold(
                  color: kNotificationCheckText,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 23.0)),
          Text(
            'Ratings',
            style: TextStyles.medium(
              color: kFilterBottomSheetLabelColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          //ratings container
          Container(
            height: 40.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 9.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(children: [
              
            ]),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 28.0)),
          Text(
            'Facilities',
            style: TextStyles.medium(
              color: kFilterBottomSheetLabelColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filterBottomSheetImageContainer(imgUrl: 'images/restroom.png'),
                _filterBottomSheetImageContainer(imgUrl: 'images/wifi.png'),
                _filterBottomSheetImageContainer(imgUrl: 'images/pool.png'),
                _filterBottomSheetImageContainer(imgUrl: 'images/wifi.png'),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 32.0)),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: TextStyles.bold(
                      color: const Color(0xFF0D34BF),
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: TextStyles.bold(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    fixedSize: const Size(151.0, 40.0),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 6.0)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _filterBottomSheetImageContainer({required String imgUrl}) {
    return Container(
      height: 48.0,
      width: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFFA1B6FF),
          width: 1.0,
        ),
      ),
      child: ImageIcon(
        AssetImage(imgUrl),
      ),
    );
  }
}
