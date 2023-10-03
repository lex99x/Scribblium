//
//  CustomAlertView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 09/09/22.
//

import SwiftUI

struct CustomLeaveDrawView: View {
    
    @Binding var shown: Bool
    @Binding var navigationBond: NavigationBond
    @Binding var isShowingAlert: Bool
    @Binding var timerRunning: Bool
    
    var body: some View {
        VStack {
            Text("pleaseWait")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 99, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(.tertiaryColor1)
                .padding([.vertical], 12)

            Text("ifYouLeaveNow")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(.tertiaryColor1)
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            
            Divider()
            
            HStack {
                Button {
                    shown.toggle()
                    isShowingAlert = false
//                    print(navigationBond.getData() as! Int)
                    withAnimation {
                        navigationBond.setDestination(.home)
                    }
                } label: {
                    Text("leave")
                        .font(.custom("Rubik-SemiBold", size: 17))
                        .frame(maxWidth: 49, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        .foregroundColor(.tertiaryColor1)
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
                    Text("back")
                        .font(.custom("Rubik-SemiBold", size: 17))
                        .frame(maxWidth: 66, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        .foregroundColor(.tertiaryColor1)
                        .padding([.trailing], 35)
                        .padding([.leading], 34)
                        .padding([.bottom], 12)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color.secondaryColor3)
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(.tertiaryColor1))
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
            Text("pausedGame")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 112, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .padding([.vertical], 12)
                .foregroundColor(.tertiaryColor1)
            Text("youPausedGame")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 129, maxHeight: 16)
                .minimumScaleFactor(0.1)
                .foregroundColor(.tertiaryColor1)
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
                isShowingAlert = false
                timerRunning = true
            } label: {
                Text("resume")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 67, maxHeight: 20)
                    .minimumScaleFactor(0.1)
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.tertiaryColor1)
                    .padding([.horizontal], 102)
                    .padding([.vertical], 12)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color.secondaryColor3)
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(.tertiaryColor1))
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
            Text("timesUp")
                .font(.custom("Rubik-SemiBold", size: 17))
                .frame(maxWidth: 106, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(.tertiaryColor1)
                .padding([.vertical], 12)

            Text("yourScribbliunsCounted")
                .font(.custom("Rubik-Regular", size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(.tertiaryColor1)
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            
            Divider()
            
            Button {
                shown.toggle()
                isShowingAlert = false
//                print(navigationBond.getData() as! Int)
                withAnimation {
                    navigationBond.setDestination(.cleo)
                }
            } label: {
                Text("ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.tertiaryColor1)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color.secondaryColor3)
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(.tertiaryColor1))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomLeaveDrawView(shown: .constant(false),
                            navigationBond: .constant(NavigationBond(destination: .cleo)),
                            isShowingAlert: .constant(false),
                            timerRunning: .constant(false))
        
        CustomPaused(shown: .constant(false),
                     isShowingAlert: .constant(false),
                     timerRunning: .constant(false))
        
        CustomAlertTimesUp(
            shown: .constant(false),
            navigationBond: .constant(NavigationBond(destination: .cleo)),
            isShowingAlert: .constant(false)
        )
        
    }
}
