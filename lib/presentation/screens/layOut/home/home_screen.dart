import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';
import 'package:my_guide/presentation/screens/layOut/components/layOut_app_bar.dart';
import 'package:my_guide/presentation/screens/layOut/home/components/home_item.dart';
import 'package:my_guide/presentation/screens/layOut/home/components/home_list_item.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_state.dart';
import 'package:my_guide/presentation/widgets/custom_loading_indicator.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_strings.dart';
import 'package:my_guide/utils/main_functions.dart';

import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../widgets/customDrawer/custom_drawer.dart';
import '../audioBook/cubit/audio_book_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AudioBookCubit>().getCategoryBook(id: 8);
    context.read<ProfileCubit>().getRelativeProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: LayOutAppBar(
        title: AppStrings.discover,
        trailing: InkWell(
          onTap: () {},
          child: Image.asset(
            AppIcons.notificationIcon,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
        children: [
          AppSize.h20.ph,
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              var profileCubit = context.read<ProfileCubit>();
              var relativeProfileDataModel = profileCubit.relativeProfileDataModel;
              return ConditionalBuilder(
                condition: state is! GetRelativeProfileLoadingState && relativeProfileDataModel.data != null,
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppText(
                      text: AppStrings.welcome,
                      textSize: 32.sp,
                      textWeight: FontWeight.w700,
                    ),
                    AppSize.h25.ph,
                    HomeItem(
                      relativeProfileDataModel: relativeProfileDataModel,
                    ),
                  ],
                ),
                fallback: (context) =>const CustomLoadingIndicator(),
              );
            },
          ),
          AppSize.h35.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomAppText(
                  text: AppStrings.mostListened,
                  textSize: 20.sp,
                  textWeight: FontWeight.w700,
                ),
              ),
              Flexible(
                child: CustomAppText(
                  text: AppStrings.seeAll,
                  textColor: AppColors.buttonAppColor,
                ),
              ),
            ],
          ),
          AppSize.h25.ph,
          BlocConsumer<AudioBookCubit, AudioBookState>(
            listener: (context, state) {
              if (state is GetCategoryBookError) {
                customNotificationToast(
                    context: context,
                    content: state.messageError,
                    color: AppColors.errorColor);
              }
            },
            builder: (context, state) {
              var audioBookCubit = context.read<AudioBookCubit>();
              var bookDataModel = audioBookCubit.booksDataModel.data;
              return ConditionalBuilder(
                condition:
                state is! GetBookDetailsLoading && bookDataModel != null,
                builder: (context) =>
                    GridView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: bookDataModel!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: context.withFormFactor<int>(
                                onMobile: 2, onTablet: 8, onDesktop: 12),
                            crossAxisSpacing: AppSize.w10,
                            mainAxisSpacing: AppSize.h10,
                            mainAxisExtent: 210.h),
                        itemBuilder: (context, index) =>
                            HomeListItem(
                              id: bookDataModel[index].id!,
                              image: bookDataModel[index].img!,
                              title: bookDataModel[index].name!,
                              author: bookDataModel[index].author!,
                            )),
                fallback: (context) => const CustomLoadingIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
