import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';
import 'package:random_color/random_color.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          SizedBox(height: 60.0),
          Container(
            child: Text(
              "CONTACT ME",
              style: Constants.secondaryTitles,
            ),
          ),
          SizedBox(height: 20.0),
          CustomLineStarWidget(borderColor: Colors.brown.shade900),
          SizedBox(height: 60.0),
          customForm(width),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  Widget customForm(width) {
    return ResponsiveBuilder(
      builder: (context, sizing) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          width: sizing.deviceScreenType == DeviceScreenType.Mobile
              ? width
              : width * 0.66,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _textFormField(nameController, "Name"),
                _textFormField(emailController, "Email"),
                _textFormField(msgController, "Message"),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: MaterialButton(
                    hoverColor: Colors.pink,
                    color: Colors.black.withOpacity(0.77),
                    onPressed: () {},
                    child: Text("Send",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    minWidth: sizing.deviceScreenType == DeviceScreenType.Mobile
                        ? width
                        : 150.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _textFormField(controller, hintText) {
    var randomColor = RandomColor();
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      onChanged: (text) {
        print(text);
      },
      cursorColor: randomColor.randomColor(),
    );
  }
}
