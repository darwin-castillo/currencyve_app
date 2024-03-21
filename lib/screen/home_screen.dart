import 'package:dolarvzla/common/currency_input_formatter.dart';
import 'package:dolarvzla/config/color_app.dart';
import 'package:dolarvzla/provider/home_provider.dart';
import 'package:dolarvzla/widgets/logo_widget.dart';
import 'package:dolarvzla/widgets/textfield_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Widget _calcView(BuildContext context, {required HomeProvider homeProvider}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFieldRounded(
                  icon: Icons.money,
                  controller: homeProvider.moneyMasked,
                  hint: "Bolivares Venezolanos (VES)",
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => homeProvider.calcValue(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: ColorsApp.blue),
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.currency_exchange_outlined,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${homeProvider.formattedAmount}",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        )

        /*    TextFieldRounded(
              hint: "Dolares Estadounidenses (USD)",
            ),*/
      ],
    );
  }

  Widget _exchangeView(BuildContext context,
      {required HomeProvider homeProvider}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Text("Tasa del día:"),
        const SizedBox(
          height: 20,
        ),
        Text(
          "\$1 USD → VED Bs. ${homeProvider.currency.value}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Scaffold(
            body: MaterialApp(
              debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.currency_exchange_outlined)),
                    Tab(icon: Icon(Icons.calculate_outlined)),
                  ],
                ),
                title: LogoWidget(size: 80.0),
              ),
              body: TabBarView(
                children: [
                  _exchangeView(context, homeProvider: homeProvider),
                  _calcView(context, homeProvider: homeProvider),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
