import 'package:flutter/material.dart';

import 'choicechip.dart';

class SpecialtiesChoiceChips {
  static final all = <ChoiceChipData> [
    ChoiceChipData(
      label: 'All',
      isSelected: true,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'English for kids',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'English for Business',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Conversational',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'STARTERS',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'MOVERS',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'FLYERS',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'KET',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'PET',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'IELTS',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'TOEFL',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'TOEIC',
      isSelected: false,
      //selectedColor: Colors.blue,
      //textColor: Colors.white,
    ),
  ];

  static List<ChoiceChipData> getSpecialties(List<String> specialties, bool isSelect){
    List<ChoiceChipData> list = [];
    for(var i = 0; i < specialties.length; i++){
      list.add(ChoiceChipData(
        label: specialties[i],
        isSelected: isSelect,
        //selectedColor: Colors.blue,
        //textColor: Colors.white,
      ));
    }
    return list;
  }
}