import 'package:product_app/helpers/helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/asset1.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          )),
        ),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 400.0),
                    child: Column(
                      children: [
                        Text(
                          "Access Credit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Provides SME’s easy access to retail \nfinancing solutions for scalable \nbusiness growth",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 25,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 87, 28, 1),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadiusDirectional.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 220,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(238, 87, 28, 1),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () => context.go("/login"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 50),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ));
  }
}
