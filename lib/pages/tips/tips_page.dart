import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/tip.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/common/search_bar.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/home/tip_list_tile.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  List<Tip> tips = [];
  List<Tip> filteredTips = [];

  void search(String text) {
    final term = text.toLowerCase();

    if (term.trim().isEmpty) {
      setState(() => filteredTips = tips);
    } else {
      setState(() => filteredTips = tips
          .where(
              (tip) => tip.serverName.toLowerCase().contains(term) || tip.restaurantName.toLowerCase().contains(term))
          .toList(growable: false));
    }
  }

  @override
  void initState() {
    for (int i = 0; i < 20; i++) {
      tips.add(Tip.random());
    }
    tips.sort((a, b) => b.date.compareTo(a.date));

    filteredTips = tips;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              BigTextHeader(title: "Your tips", action: CloseIconButton()),
              SizedBox(height: 12),
              SearchBar(onChanged: search),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredTips.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TipListTile(filteredTips[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
