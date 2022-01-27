import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_travel_crud/constant/validator.dart';
import 'package:getx_travel_crud/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: 바탕 눌렀을 때 focus Out.
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff050522),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    'assets/login_back.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Welcome',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: const Color(0xffEF5858)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '로그인을 해주세요!!\n"앵듀맹듀"에 오신것을 환영합니다!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  //TODO: Button width는 child 따라감.
                  // 고로 버튼 늘리고 싶으면 따로 width 줘야한다.
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Create Account',
                      onPressed: ()=> registerBottomSheet(context),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Login',
                      onPressed: () => loginBottomSheet(context),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.onLoading.value,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black26,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> registerBottomSheet(BuildContext context) {
    return Get.bottomSheet(
      Form(
        key: controller.signUpFormKey,
        //TODO: BottomSheet Default가 Half라서 builder 취해줘야한다.
        child: Builder(
          builder: (context) {
            return Container(
              height: Get.height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), 
                  topRight: Radius.circular(30),
                ),
                color: Color(0xffFFECAA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                //TODO: ListView 사용 또는 DraggableScrollalbeSheet 사용.
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.back();
                          controller.signUpClear();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.timesCircle,
                          color: Color(0xffEF5858),
                        ),
                      ),
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: controller.signUpEmail,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye, color: Colors.black,),
                        hintText: 'info@example.com',
                        labelText: 'username/email',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(controller.pwFocus);
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '이메일은 필수사항입니다.';
                        }
                        if (!isEmailValid(val)) {
                          return '잘못된 이메일 형식입니다.';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: controller.signUpPw,
                      focusNode: controller.pwFocus,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.lock, color: Colors.black,),
                        hintText: '비밀번호',
                        labelText: 'password',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        controller.pwFocus.unfocus();
                        FocusScope.of(context).requestFocus(
                          controller.checkPwFocus,
                        );
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '비밀번호는 필수사항입니다.';
                        }
                        if (val.length < 8) {
                          return '8자리 이상 입력하세요';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: controller.pwCheck,
                      focusNode: controller.checkPwFocus,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.lock, color: Colors.black),
                        hintText: '비밀번호 재입력',
                        labelText: 'password check',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (val) {
                        if (controller.signUpPw.text != val) {
                          return '확인 비밀번호가 틀립니다.';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: SheetButton(
                        text: 'Register',
                        onPressed: () {
                          if (controller.signUpFormKey.currentState!.validate()) {
                            Get.back();
                            controller.signUp();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      backgroundColor: const Color(0xffFFECAA),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
    );
  }

  Future<dynamic> loginBottomSheet(BuildContext context) {
    return Get.bottomSheet(      
      Form(
        //TODO: FormKey 중복 X
        key: controller.loginFormKey,
        // TODO: Bottom Sheet 높이 설정 using Builder
        child: Builder(
          builder: (context) {
            return GetBuilder<LoginController>(
              builder: (_) {
                return Container(
                  height: Get.height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    // TODO: Dialog 안에서 Listview 가능하다.
                    child: ListView( 
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome!!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Get.back();
                              controller.signInClear();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.timesCircle,
                              color: Color(0xffEF5858),
                            ),
                          ),
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: controller.signInEmail,
                          autofocus: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.remove_red_eye, color: Colors.black,),
                            hintText: 'info@example.com',
                            labelText: 'username/email',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            // TODO: borderRadius는 const X
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onFieldSubmitted: (val) {
                            //TODO: FocusScope는 중복돼도 상관없다.
                            FocusScope.of(context).requestFocus(controller.pwFocus);
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '이메일은 필수사항입니다.';
                            }
                            if (!isEmailValid(val)) {
                              return '잘못된 이메일 형식입니다.';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: controller.signInPw,
                          focusNode: controller.pwFocus,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.lock, color: Colors.black,),
                            hintText: '비밀번호',
                            labelText: 'password',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // TODO: Enter 했을 때 unFocus
                          onFieldSubmitted: (val) {
                            controller.pwFocus.unfocus();
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '비밀번호는 필수사항입니다.';
                            }
                            if (val.length < 8) {
                              return '8자리 이상 입력하세요';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            //TODO: Checkbox 크기는 SizedBox로 줄이기
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: controller.isStoreId,
                                onChanged: (value) {
                                  controller.isStoreId = value;
                                  controller.update();
                                },
                                activeColor: const Color(0xffD7D7D7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                side: const BorderSide(color: Colors.black,),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              'Remember me', 
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(color:Colors.black,)
                            ),
                            const Spacer(),
                            Text(
                              'Forgot Password?',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(color:Colors.black,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: SheetButton(
                            text: 'Login',
                            onPressed: () {
                              if (controller.loginFormKey.currentState!.validate()) {
                                Get.back();
                                controller.signIn();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.back();
                            registerBottomSheet(context);
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text:'Don`t have an account? '),
                                  TextSpan(text:'Register',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
      backgroundColor: const Color(0xffFFECAA),
      //TODO: 이거 TURE 여야 높이 늘리기 가능 Defalut: Half
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
    );
  }
}

class SheetButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SheetButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff050522),
        onPrimary: const Color(0xffFFDE69),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: const Color(0xffFFDE69),
            ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: const BorderSide(
          width: 2,
          color: Color(0xffFFDE69),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: const Color(0xffFFDE69),
            ),
      ),
    );
  }
}
