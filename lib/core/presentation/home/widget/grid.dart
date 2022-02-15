import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/core/const/color_constants.dart';
import 'package:wordle/core/data/data_singleton.dart';
import 'package:wordle/core/presentation/home/cubit/home_cubit.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, currentState) => currentState is GridUpdateState,
      builder: (context, state) {
        final data = DataSingleton();
        final letters = data.getLetters();
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(30, (index) {
              final letter = letters.length > index ? letters[index] : "";
              // TODO: change here for the box colors
              //Color color = ColorConstants.primaryGreyLight;
              Color? color = Color.fromARGB(255, 46, 46, 46);
              if (letter.isNotEmpty &&
                  data.currentWordIndex > 0 &&
                  index < 5 * data.currentWordIndex) {
                final indexInRow = index % 5;
                if (data.gridData.join().contains(letter)) {
                  color = ColorConstants.primaryGreyMedium;
                }
                if (data.secretWord.contains(letter)) {
                  color = ColorConstants.primaryOrange;
                }
                if (data.secretWord[indexInRow] == letter) {
                  color = ColorConstants.primaryGreen;
                }
              }
              return Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(1)),
                  // TODO: change here for the box  border color light theme colors
                  border: Border.all(
                      color: const Color.fromARGB(255, 107, 107, 107)),
                  color: color,
                ),
                child: Text(
                  letter.toUpperCase(),
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600, fontSize: 30),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
