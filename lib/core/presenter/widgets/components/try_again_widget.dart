import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';

class TryAgainWidget extends StatelessWidget {
  final bool isLoadingGeoPosition;
  final Function onPressed;

  const TryAgainWidget({
    super.key,
    required this.isLoadingGeoPosition,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (isLoadingGeoPosition) {
      return SliverFillRemaining(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: SpacingParam.s4),
              child: Text(
                'Obtendo sua geolocalização',
                style: theme.textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: SpacingParam.s8),
              child: Text(
                'Por favor habilite sua geolocalização quando perguntado.',
                style: theme.textTheme.bodyText2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(SpacingParam.s4),
              child: LinearProgressIndicator(),
            )
          ],
        ),
      );
    }

    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: SpacingParam.s4),
            child: Text(
              'Ops!',
              style: theme.textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: SpacingParam.s8),
            child: Text(
              'Desculpe, algo deu errado.',
              style: theme.textTheme.bodyText2,
            ),
          ),
          OutlinedButton(
            onPressed: () => onPressed(),
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
