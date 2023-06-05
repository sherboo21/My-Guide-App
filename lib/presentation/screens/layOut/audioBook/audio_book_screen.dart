import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/components/audio_book_item.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/cubit/audio_book_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/components/layOut_app_bar.dart';
import 'package:my_guide/presentation/widgets/custom_loading_indicator.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../../../utils/main_functions.dart';
import '../../../stateMangements/cubit/app_cubit.dart';
import '../../../widgets/customDrawer/custom_drawer.dart';
import 'components/audio_book_tab_bar.dart';

class AudioBookScreen extends StatefulWidget {
  const AudioBookScreen({Key? key}) : super(key: key);

  @override
  State<AudioBookScreen> createState() => _AudioBookScreenState();
}

class _AudioBookScreenState extends State<AudioBookScreen> {
  final scrollController = ScrollController();
  int? categoryId;

  @override
  void initState() {
    super.initState();
    context.read<AudioBookCubit>().getCategories();
  }

  @override
  void didChangeDependencies() {
    context.read<AppCubit>().updateIndex(0);
    context.read<AudioBookCubit>().getCategoryBook(id: 1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioBookCubit, AudioBookState>(
      listener: (context, state) {
        if (state is GetCategoriesError || state is GetCategoryBookError) {
          customNotificationToast(
              context: context,
              color: AppColors.errorColor,
              content: AppStrings.anErrorOccurred);
        }
      },
      builder: (context, state) {
        var audioBookCubit = context.read<AudioBookCubit>();
        var categoriesDataModel = audioBookCubit.categoriesDataModel.data;
        var bookDataModel = audioBookCubit.booksDataModel.data;
        return Scaffold(
            drawer: const CustomDrawer(),
            appBar: LayOutAppBar(
              title: AppStrings.audioBook,
            ),
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                AppSize.h10.ph,
                CustomAppText(
                  text: AppStrings.audiBookList,
                  textColor: AppColors.buttonAppColor,
                  textSize: 20.sp,
                  textWeight: FontWeight.w700,
                ).addSymmetricPadding(hVal: AppSize.w15),
                AppSize.h20.ph,
                BlocBuilder<AppCubit, int>(
                  builder: (context, state) {
                    var appCubit = context.read<AppCubit>();
                    return ConditionalBuilder(
                      condition: state is! GetCategoriesLoading &&
                          categoriesDataModel != null,
                      builder: (context) => Visibility(
                        visible: state is GetCategoriesError,
                        replacement: SizedBox(
                          height: AppSize.h60,
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: scrollController,
                              padding:
                                  EdgeInsets.symmetric(horizontal: AppSize.w12),
                              itemCount: categoriesDataModel!.length,
                              itemBuilder: (context, index) => AudioBookTabBar(
                                    appCubit: appCubit,
                                    function: () {
                                      appCubit.updateIndex(index);
                                      context
                                          .read<AudioBookCubit>()
                                          .getCategoryBook(
                                              id: categoriesDataModel[index]
                                                  .id!);
                                    },
                                    index: index,
                                    title: categoriesDataModel[index].name!,
                                  ),
                              separatorBuilder: (context, index) =>
                                  AppSize.w15.pw),
                        ),
                        child: Center(
                          child: CustomAppText(
                            text: AppStrings.anErrorOccurred,
                            textSize: 24.sp,
                            textColor: AppColors.errorColor,
                          ),
                        ),
                      ),
                      fallback: (context) => const CustomLoadingIndicator(),
                    );
                  },
                ),
                ConditionalBuilder(
                  condition:
                      state is! GetCategoryBookLoading && bookDataModel != null,
                  builder: (context) => Visibility(
                    visible: state is GetCategoryBookError,
                    replacement: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      itemCount: bookDataModel!.length,
                      itemBuilder: (context, index) => AudioBookItem(
                          id: bookDataModel[index].id!,
                          image: bookDataModel[index].img!,
                          title: bookDataModel[index].name!,
                          desc:
                              '${bookDataModel[index].author!}, ${bookDataModel[index].publishYear!}'),
                      separatorBuilder: (context, index) => AppSize.h30.ph,
                    ),
                    child: Center(
                      child: CustomAppText(
                        text: AppStrings.anErrorOccurred,
                        textColor: AppColors.errorColor,
                        textSize: 24.sp,
                      ),
                    ),
                  ),
                  fallback: (context) => const CustomLoadingIndicator()
                      .addSymmetricPadding(vVal: 200.h),
                )
              ],
            ));
      },
    );
  }
}
