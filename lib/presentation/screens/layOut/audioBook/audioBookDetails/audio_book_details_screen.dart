import 'package:audioplayers/audioplayers.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/audioBookDetails/components/audio_book_details_button.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/audioBookDetails/components/audio_book_details_item.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/cubit/audio_book_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/components/layOut_app_bar.dart';
import 'package:my_guide/presentation/widgets/custom_loading_indicator.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_imgs.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/app_strings.dart';
import 'package:my_guide/utils/main_functions.dart';

class AudioBookDetailsScreen extends StatefulWidget {
  final int id;

  const AudioBookDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AudioBookDetailsScreen> createState() => _AudioBookDetailsScreenState();
}

class _AudioBookDetailsScreenState extends State<AudioBookDetailsScreen> {
  bool _isSelected = false;
  final audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void _audioPlayer() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AudioBookCubit>().getBookDetails(id: widget.id);
    _audioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: StartPrefs.getThemeValue() == false
              ? Colors.white
              : AppColors.darkThemeScaffoldColor),
      child: BlocConsumer<AudioBookCubit, AudioBookState>(
        listener: (context, state) {
          if (state is GetBookDetailsError) {
            customNotificationToast(
                context: context,
                content: state.messageError,
                color: AppColors.errorColor);
          }
        },
        builder: (context, state) {
          var audioBookCubit = context.read<AudioBookCubit>();
          var bookDetailsDataModel = audioBookCubit.bookDetailsDataModel.data;
          return Scaffold(
            appBar: LayOutAppBar(
              title: AppStrings.audioBook,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Image.asset(
                    AppIcons.arrowBackIcon,
                    fit: BoxFit.contain,
                  )),
            ),
            body: ConditionalBuilder(
              condition: state is! GetBookDetailsLoading &&
                  bookDetailsDataModel != null,
              builder: (context) => Center(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    AppSize.h10.ph,
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Material(
                          elevation: 20,
                          shadowColor: Colors.white,
                          color: StartPrefs.getThemeValue() == false
                              ? Colors.white
                              : AppColors.darkThemeScaffoldColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          child: Container(
                            height: AppSize.h10,
                          ),
                        ).addSymmetricPadding(hVal: AppSize.w12),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSize.w10),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                                color: StartPrefs.getThemeValue() == false
                                    ? Colors.white
                                    : AppColors.darkThemeScaffoldColor),
                            child: Column(
                              children: [
                                AppSize.h30.ph,
                                AudioBookDetailsItem(
                                  isSelected: _isSelected,
                                  isPlaying: _isPlaying,
                                  audioPlayFunction: () async {
                                    if (_isPlaying) {
                                      await audioPlayer.pause();
                                    } else {
                                      await audioPlayer.play(UrlSource(
                                          bookDetailsDataModel.audioFile!));
                                    }
                                  },
                                  sliderFunction: (value) async {
                                    final position =
                                        Duration(seconds: value.toInt());
                                    await audioPlayer.seek(position);
                                  },
                                  duration: duration,
                                  position: position,
                                  image: bookDetailsDataModel!.img!,
                                  title: bookDetailsDataModel.name!,
                                  authorAndYear:
                                      '${bookDetailsDataModel.author!} ${bookDetailsDataModel.publishYear!}',
                                  desc:
                                      'Is a novel by American writer Ernest Hemingway, his first, that portrays American and British expatriates who travel from paris to the festival of San Fermin in pamplona to watch the running of the bulls and the bullfights.an early modernist novel, it received mixed reviews upon publication. ',
                                ),
                                AppSize.h35.ph,
                                Visibility(
                                    visible: _isSelected == false,
                                    child: AudioBookDetailsButton(
                                      function: () => setState(() {
                                        _isSelected = true;
                                      }),
                                    )),
                                AppSize.h30.ph,
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
              fallback: (context) => state is GetBookDetailsError
                  ? Center(
                      child: CustomAppText(
                        text: AppStrings.anErrorOccurred,
                        textSize: 24.sp,
                        textColor: AppColors.errorColor,
                      ),
                    )
                  : const CustomLoadingIndicator(),
            ),
          );
        },
      ),
    );
  }
}
