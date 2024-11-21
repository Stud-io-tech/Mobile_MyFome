import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/institute/institute_controller.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/link/see_more_store_link.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class StoreListView extends StatefulWidget {
  const StoreListView({super.key});

  @override
  State<StoreListView> createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {
  final instituteController = Injector.get<InstituteController>();

  @override
  void initState() {
    super.initState();
    instituteController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Observer(builder: (context) {
            final institutePageDto = instituteController.instituteListPage;
            if (institutePageDto == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: institutePageDto.instituteDto.length,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final model = institutePageDto.instituteDto[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                          '/institute/detail',
                          arguments: {
                            'instituteId': model.id,
                          },
                        ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: Scale.xs),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: LightColors.tertiary,
                            width: 2,
                          ),
                          color: LightColors.tertiary,
                          image: DecorationImage(
                            image: NetworkImage(model.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        SeeMoreStoreLink(
          onTap: () => Navigator.of(context).pushReplacementNamed(
            '/search/institute',
          ),
        ),
      ],
    );
  }
}
