
import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/auth/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
enum Auth {
  signin,
  signup,
}
class AuthScreen extends StatefulWidget{
  static const String routeName ='/auth-screen';
  const AuthScreen ({Key? key }) : super(key :key);

  @override 
  State<AuthScreen> createState() => _AuthScreenState();


}
class _AuthScreenState extends State<AuthScreen>{
  Auth _auth =Auth.signup;
 
  final _signUpFormKey = GlobalKey<FormState>();
    final _signinFormKey = GlobalKey<FormState>();
final AuthService authService = AuthService();

  final TextEditingController _emailcontroller =TextEditingController();
   final TextEditingController _passwordcontroller =TextEditingController();
    final TextEditingController _namecontroller =TextEditingController();

    @override
    void dipose(){
      super.dispose();
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
      _namecontroller.dispose();
    }
    void signUpUser(){
        authService.signUpUser(
          context: context,
           email: _emailcontroller.text,
            password: _passwordcontroller.text,
             name: _namecontroller.text);
    } 
    void signInUser(){
        authService.signInUser(
          context: context,
         email:_emailcontroller.text ,
          password:_passwordcontroller.text );
         
    } 
  @override 

  Widget build (BuildContext context){
    
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
               crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              const Text("Welcome" ,
               style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
               ) ,),
               ListTile(
                title: const Text('Create Account ',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                )),
                    tileColor: _auth == Auth.signup?
                  GlobalVariables.backgroundColor :GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value:  Auth.signup,
                  groupValue: _auth ,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth =val!;
                    });
                  }

             ),
               ),
               if(
                _auth == Auth.signup
               )
               Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                 child: Form(
                  key:   _signUpFormKey ,
                  child: Column(
                 
                    children :[
                        CustomTextField(
                        controller: _namecontroller, hintText: 'Name',),
                        const SizedBox(height: 10,),
                        CustomTextField(
                        controller: _emailcontroller,
                         hintText: 'Email' ,),
                          const SizedBox(height: 10,),
                         CustomTextField(
                        controller: _passwordcontroller, hintText: 'Password',),
                        const SizedBox(height: 10,),
                        CustomButton(text:"Sign Up " , onTap: (){
                        if(_signUpFormKey.currentState!.validate()){
                          signUpUser();
                        }

                        }
                        )
                       
                             ],
                  ),
                 ),
               ),
                ListTile(
                   tileColor: _auth == Auth.signin?
                  GlobalVariables.backgroundColor :GlobalVariables.greyBackgroundCOlor,
              
                title: const Text('sign In',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                )),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value:  Auth.signin,
                  groupValue: _auth ,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth =val!;
                    });
                  }

             ),
               ),
               if(
                _auth == Auth.signin
               )
               Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                 child: Form(
                  key:   _signinFormKey ,
                  child: Column(
                 
                    children :[
                       
                      CustomTextField(
                        controller: _emailcontroller,
                         hintText: 'Email' ,),
                          const SizedBox(height: 10,),
                         CustomTextField(
                        controller: _passwordcontroller, hintText: 'Password',),
                        const SizedBox(height: 10,),
                        CustomButton(text:"Sign In " , onTap: (){
                           if(_signinFormKey.currentState!.validate()){
                          signInUser();
                        }


                        }
                        )
                       
                             ],
                  ),
                 ),
               ),
            ],
          ),
        ),
      ),

    );
  } 
}