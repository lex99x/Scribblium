//
//  CustomAlertView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 09/09/22.
//

import SwiftUI

struct CustomAlertTutorial: View {
    
    @Binding var shown: Bool
    @Binding var isShowingAlert: Bool
    
    var body: some View {
        VStack {
            Text("How to play?")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 106, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: false)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("TertiaryColor-1"))
                .padding([.horizontal], 118)
                .padding([.top], 16)

            Text("Draw and confirm as many drawings as possible in 30 seconds!")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 214, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: false)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 28)
            
            Divider()
            
            Button {
                shown.toggle()
                isShowingAlert = false
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(Color("TertiaryColor-1"))
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomLeaveDrawView: View {
    
    @Binding var shown: Bool
    @Binding var navigationBond: NavigationBond
    @Binding var isShowingAlert: Bool
    @Binding var timerRunning: Bool
    
    var body: some View {
        VStack {
            Text("Please wait!")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 99, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color("TertiaryColor-1"))
                .padding([.vertical], 12)

            Text("If you leave now you will lose your current progress!")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            
            Divider()
            
            HStack {
                Button {
                    shown.toggle()
                    isShowingAlert = false
                    print(navigationBond.getData() as! Int)
                    withAnimation {
                        navigationBond.setDestination(.home)
                    }
                } label: {
                    Text("Leave")
                        .font(.custom("Rubik-SemiBold", size: 17))
                        .frame(maxWidth: 49, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        //.multilineTextAlignment(.center)
                        .foregroundColor(Color("TertiaryColor-1"))
                        .padding([.bottom], 12)
                        .padding([.trailing], 42)
                        .padding([.leading], 44)
                    
                }
                
                Divider()
                
                Button {
                    shown.toggle()
                    isShowingAlert = false
                    timerRunning = true

                } label: {
                    Text("Go back")
                        .font(.custom("Rubik-SemiBold", size: 17))
                        .frame(maxWidth: 66, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        .foregroundColor(Color("TertiaryColor-1"))
                        .padding([.trailing], 35)
                        .padding([.leading], 34)
                        .padding([.bottom], 12)
                        //.multilineTextAlignment(.center)

                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomPaused: View {
    
    @Binding var shown: Bool
    @Binding var isShowingAlert: Bool
    @Binding var timerRunning: Bool
    
    var body: some View {
        VStack {
            Text("Game paused")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 112, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("You paused the game")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 129, maxHeight: 16)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
                isShowingAlert = false
                timerRunning = true
            } label: {
                Text("Resume")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 67, maxHeight: 20)
                    .minimumScaleFactor(0.1)
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("TertiaryColor-1"))
                    .padding([.horizontal], 102)
                    .padding([.vertical], 12)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertTimesUp: View {
    
    @Binding var shown: Bool
    @Binding var navigationBond: NavigationBond
    @Binding var isShowingAlert: Bool
    
    var body: some View {
        VStack {
            Text("Your time's up!")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 106, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color("TertiaryColor-1"))
                .padding([.vertical], 12)

            Text("Your scribbliuns have been successfully counted!")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            
            Divider()
            
            Button {
                shown.toggle()
                isShowingAlert = false
                print(navigationBond.getData() as! Int)
                withAnimation {
                    navigationBond.setDestination(.cleo)
                }
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(Color("TertiaryColor-1"))
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertOops: View {
    
    @Binding var shown: Bool
    @Binding var isShowingAlert: Bool

    var body: some View {
        VStack {
            Text("Oops! :(")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 62, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.top], 16)

            Text("That's not the instructed drawing, try again, please!")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 28)
            
            Divider()
            
            Button {
                shown.toggle()
                isShowingAlert = false
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(Color("TertiaryColor-1"))
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertEmpty: View {
    
    @Binding var shown: Bool
    @Binding var isShowingAlert: Bool

    var body: some View {
        VStack {
            Text("Oops!")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 106, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("You can't proceed with an empty drawing!")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
                isShowingAlert = false
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(Color("TertiaryColor-1"))
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

//struct CustomAlertBluetooth: View {
//
//    @Binding var shown: Bool
//
//    var body: some View {
//        VStack {
//            Text("NOOOOOO...")
//                .font(.custom("Rubik-SemiBold", size: 17))
//                .frame(maxWidth: 106, maxHeight: 20)
//                .minimumScaleFactor(0.1)
//                .padding([.vertical], 12)
//                .foregroundColor(Color("TertiaryColor-1"))
//            Text("Bluetooth is turned off, to join a game you must turn it on!")
//                .font(.custom("Rubik-Regular", size: 13))
//                .frame(maxWidth: 214, maxHeight: 32)
//                .minimumScaleFactor(0.1)
//                .foregroundColor(Color("TertiaryColor-1"))
//                .multilineTextAlignment(.center)
//                .padding([.horizontal], 32)
//            Divider()
//            Button {
//                shown.toggle()
//            } label: {
//                Text("Ok")
//                    .font(.custom("Rubik-SemiBold", size: 17))
//                    .frame(maxWidth: 22, maxHeight: 20)
//                    .minimumScaleFactor(0.1)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .foregroundColor(Color("TertiaryColor-1"))
//                    .multilineTextAlignment(.center)
//                    .padding([.horizontal], 124)
//                    .padding([.vertical], 11)
//            }
//        }
//        .frame(width: UIScreen.main.bounds.width-120, height: 136)
//        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
//        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
//        .cornerRadius(15)
//        .clipped()
//    }
//}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertOops(shown: .constant(false), isShowingAlert: .constant(false))
        CustomAlertTimesUp(
            shown: .constant(false),
            navigationBond: .constant(NavigationBond(destination: .cleo)),
            isShowingAlert: .constant(false)
        )
        CustomAlertEmpty(shown: .constant(false), isShowingAlert: .constant(false))
        CustomAlertTutorial(shown: .constant(false), isShowingAlert: .constant(false))
        //CustomAlertBluetooth(shown: .constant(false))
    }
}
