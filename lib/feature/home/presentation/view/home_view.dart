import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saberion_assessment/app/theme/theme.dart';
import 'package:saberion_assessment/feature/home/presentation/cubit/home_state.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  final HomeState? state;
  final Function({required String searchKey}) onSearch;
  final Function() onFetchMore;
  const HomeView(
      {super.key,
      required this.state,
      required this.onSearch,
      required this.onFetchMore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 20,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          color: primaryColor,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onFieldSubmitted: (value) => onSearch.call(searchKey: value),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: const ImageIcon(
                  AssetImage(
                    'assets/icons/menu_icon.png',
                  ),
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.builder(
                itemCount: state?.isFetching ?? false
                    ? (state?.images.length ?? 0) + 2
                    : state?.images.length ?? 0,
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  if (index == (state?.images.length ?? 0) - 1) {
                    onFetchMore.call();
                  }
                  return (state?.isFetching ?? false) &&
                      index >= (state?.images.length ?? 0)
                      ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                    ),
                  )
                      : Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: state!.images[index],
                      placeholder: (context, url) =>
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
