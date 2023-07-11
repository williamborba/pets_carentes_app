import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_carentes_app/index.dart';

class AppBarWidget extends StatelessWidget {
  final String? city;
  final String? countryCode;
  final String? street;
  final bool isLoading;
  final bool isError;

  const AppBarWidget({
    Key? key,
    this.city,
    this.countryCode,
    this.street,
    required this.isLoading,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: SpacingParam.s2,
        ),
        child: Image.asset('lib/asset/images/logo_pca_circle_bg_white.webp'),
      ),
      centerTitle: false,
      title: isError
          ? const Text('Não foi possível obter a localização...')
          : isLoading
              ? const AppBarShimmerWidget()
              : Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$city, $countryCode',
                          style: theme.textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          street ?? '',
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: SpacingParam.s6,
                      ),
                      child: Icon(
                        FontAwesomeIcons.locationCrosshairs,
                        size: 24,
                      ),
                    ),
                  ],
                ),
    );
  }
}
