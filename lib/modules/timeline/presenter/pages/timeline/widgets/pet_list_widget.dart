import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';

class PetListWidget extends StatelessWidget {
  final List<Pet> petList;

  const PetListWidget({
    super.key,
    required this.petList,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverPadding(
      padding: const EdgeInsets.only(
        top: SpacingParam.s4,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0,
          mainAxisSpacing: SpacingParam.s4,
          crossAxisSpacing: SpacingParam.s4,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: petList.length,
          (BuildContext context, int index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SpacingParam.s5),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            petList[index].photos.first.asset,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(SpacingParam.s5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SpacingParam.s4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          petList[index].getPetContentLimited(),
                          style: theme.textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: SpacingParam.s2,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              petList[index].breed,
                              style: theme.textTheme.caption,
                            ),
                            Text(
                              petList[index].getPetWeight(),
                              style: theme.textTheme.caption,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              petList[index].getPetAgeFromBirthDate(),
                              style: theme.textTheme.caption,
                            ),
                            Text(
                              petList[index].getPetGender(),
                              style: theme.textTheme.caption,
                            ),
                            Text(
                              petList[index].distanceCalculated.toString(),
                              style: theme.textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
