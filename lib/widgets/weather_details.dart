import 'package:flutter/widgets.dart';
import 'package:temp_track_app/constants.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.image,
    required this.firstRowText,
    required this.secondRowText,
  });

  final String image, firstRowText, secondRowText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 60,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstRowText,
              style: const TextStyle(
                fontSize: 16,
                color: kSubTextColor,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              secondRowText,
              style: const TextStyle(
                fontSize: 20,
                color: kMainTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
