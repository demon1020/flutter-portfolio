import 'package:portfolio/core.dart';

class Contact extends StatefulWidget {
  Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(dynamicPadding(2)),
      padding: EdgeInsets.all(dynamicPadding(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Contact"),
          SizedBox(height: dynamicHeight(2),),
          ResponsiveRowColumn(
            isPortrait: SizeConfig.isPortrait,
            children: [
              Container(
                height: SizeConfig.screenWidth + 100,
                width: SizeConfig.screenHeight,
                margin: EdgeInsets.all(dynamicPadding(2)),
                padding: EdgeInsets.all(dynamicPadding(2)),
                decoration: BoxDecoration(
                  color: Constants.kBackgroundDark2.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicTextSize(1.2),
                        ),
                      ),
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: dynamicHeight(2)),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicTextSize(1.2),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: dynamicHeight(2)),
                      Text(
                        'Message',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicTextSize(1.2),
                        ),
                      ),
                      TextFormField(
                        controller: _messageController,
                        minLines: 1,
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your message';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: dynamicHeight(2),
                      ),                          Center(
                        child: SizedBox(
                          height: dynamicHeight(7),
                          width: dynamicWidth(30),
                          child: OutlinedButton(
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                print('Name: ${_nameController.text}');
                                print('Email: ${_emailController.text}');
                                print('Message: ${_messageController.text}');
                              }
                            },
                            child: Text('Submit',style: TextStyle(fontSize: dynamicTextSize(1.5)),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dynamicHeight(2),
                      ),
                      Center(
                        child: Text(
                          "I'd love to hear from you!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: dynamicTextSize(3),
                            color: Constants.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TitleDivider(
              //   title: "CONTACT",
              //   isVerticle: true,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
