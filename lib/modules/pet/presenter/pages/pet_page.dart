import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_carentes_app/index.dart';

class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<PetApplication>(
            create: (BuildContext context) => PetApplication(),
          ),
        ],
        child: const PetPageContent(),
      );
}

class PetPageContent extends StatefulWidget {
  const PetPageContent({super.key});

  @override
  State<PetPageContent> createState() => _PetPageState();
}

class _PetPageState extends State<PetPageContent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: BlocBuilder<GeoPositionApplication, GeoPositionState>(
          builder: (BuildContext context, GeoPositionState state) {
            return AppBarWidget(
              isLoading: state is GeoPositionLoadingState ? true : false,
              isError: state is GeoPositionErrorState ? true : false,
              city: state is GeoPositionSuccessState ? state.subAdministrativeArea : null,
              countryCode: state is GeoPositionSuccessState ? state.isoCountryCode : null,
              street: state is GeoPositionSuccessState ? state.street : null,
            );
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(
          SpacingParam.s4,
        ),
        child: Text('TESTE'),
      ),
    );
  }
}
