////
////  GuestWaitingView.swift
////  ProjectPompeii
////
////  Created by Alex A. Rocha on 02/09/22.
////
//
//import SwiftUI
//
//struct GuestWaitingView: View {
//
//    var body: some View {
//
//        VStack {
//
//            VStack {
//
//                VStack {
//                    Button(action: {
//                        print("Disconnecting from host game...")
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .resizable()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(Color("SecondaryColor-1"))
//                            .overlay(
//                                Circle()
//                                    .strokeBorder(Color("Contorno"), lineWidth: 3))
//                            .font(.system(size: 60, weight: .bold))
//                            .background(
//                                Circle()
//                                    .foregroundColor(Color("TertiaryColor-1"))
//                            )
//                    }
//                    Text("Leave")
//                        .font(.custom("Rubik-Regular", size: 14))
//                        .foregroundColor(.white)
//                }
//                .padding(.bottom, 25)
//
//                ZStack{
//                    Image("friendos lightmode novo")
//                    Image("starsfriendos")
//                        .padding([.bottom], 220)
//                }
//
//                Text("Waiting for the host to start the game...")
//                    .font(.custom("Rubik-Black", size: 32))
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color("SecondaryColor-1"))
//                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
//                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
//                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
//            }
//            .padding(.horizontal)
//
//        }.frame(
//            width: UIScreen.main.bounds.width,
//            height: UIScreen.main.bounds.height
//        ).background {
//            Color("DrawBackground")
//                .ignoresSafeArea()
//            Image("padraoPortrait")
//                .resizable()
//                .scaledToFit()
//                .ignoresSafeArea()
//        }
//
//    }
//}
//
//struct GuestWaitingView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            GuestWaitingView().previewDevice("iPhone 12").preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
//            GuestWaitingView().previewDevice("iPhone 13 Pro Max").preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
//        }
//    }
//}
