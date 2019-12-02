import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/pages/welcome_message_page.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';
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
                    onPressed: () {
                      var validator = _formKey.currentState.validate();
                      _formKey.currentState.save();
                      if (validator || nameController.text.length > 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeMsgPage(
                                name: nameController.text,
                                email: emailController.text,
                                msg: msgController.text)));
                        _formKey.currentState.reset();
                      }
                    },
                    hoverColor: Colors.pink,
                    color: Constants.myPrimaryColor,
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
    return TextFormField(
      // autovalidate: true,
      enableInteractiveSelection: true,
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      // onSaved: (val) {
      //   setState(() {
      //     controller.text = val;
      //   });
      // },
      validator: (val) {
        if (val.isEmpty || val.length < 0) {
          print(val);
          return "Please provide atleast you'r name";
        }
        return "";
      },
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      onChanged: (text) {
        print(text);
      },
    );
  }
}
