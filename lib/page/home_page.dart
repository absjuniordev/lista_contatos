import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_contatos/page/cadastro_contatos_page.dart';
import 'package:lista_contatos/page/lista_contatos_page.dart';
import 'package:lista_contatos/shared/constants/color_defualt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: tabController,
          children: const [
            ListaContatosPages(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          const {},
          backgroundColor: CustomColor().getPrimeiroContainer(),
          items: const [
            TabItem(icon: FontAwesomeIcons.plus, title: 'Adcionar Contatos'),
          ],
          onTap: (_) async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => const CadastroContatosPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
