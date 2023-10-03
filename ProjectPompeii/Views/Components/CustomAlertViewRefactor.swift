//
//  CustomAlertViewRefactor.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 26/09/23.
//

import SwiftUI

struct CustomAlertViewRefactor<Content: View>: View {
    
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let actions: () -> Content
    
    init(title: LocalizedStringKey, message: LocalizedStringKey, @ViewBuilder actions: @escaping () -> Content) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    var body: some View {
        
        VStack {
            
            Text(title.self)
                .font(.custom(Font.rubikSemiboldFont, size: 17))
                .frame(maxWidth: 99, maxHeight: 20)
                .minimumScaleFactor(0.1)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(.tertiaryColor1)
                .padding([.vertical], 12)
            
            Text(message.self)
                .font(.custom(Font.rubikRegularFont, size: 13))
                .frame(maxWidth: 235, maxHeight: 32)
                .minimumScaleFactor(0.1)
                .foregroundColor(.tertiaryColor1)
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            
            Divider()
            
            actions()
            
        }
        .frame(width: UIScreen.main.bounds.width - 120, height: 136)
        .background(Color.secondaryColor3)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.tertiaryColor1)
        )
        .cornerRadius(15)
        .clipped()
        
    }
    
}

struct CustomLeavingAlertView: View {
    
    let unpauseAction: () -> ()
    
    var body: some View {
        CustomAlertViewRefactor(title: "pleaseWait",
                                message: "ifYouLeaveNow",
                                actions: {
            HStack {
                Button {
                    // TODO: navigate back to home screen
                } label: {
                    Text("leave")
                        .font(.custom(Font.rubikSemiboldFont, size: 17))
                        .frame(maxWidth: 49, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        .foregroundColor(.tertiaryColor1)
                        .padding([.bottom], 12)
                        .padding([.leading], 44)
                        .padding([.trailing], 42)
                }
                Divider()
                Button {
                    unpauseAction()
                } label: {
                    Text("back")
                        .font(.custom(Font.rubikSemiboldFont, size: 17))
                        .frame(maxWidth: 66, maxHeight: 20)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: true, vertical: true)
                        .foregroundColor(.tertiaryColor1)
                        .padding([.bottom], 12)
                        .padding([.leading], 34)
                        .padding([.trailing], 35)
                }
            }
        })
    }
    
}

struct CustomPausingAlertView: View {
    
    let unpauseAction: () -> ()
    
    var body: some View {
        CustomAlertViewRefactor(title: "pausedGame",
                                message: "youPausedGame",
                                actions: {
            Button {
                unpauseAction()
            } label: {
                Text("resume")
                    .font(.custom(Font.rubikSemiboldFont, size: 17))
                    .frame(maxWidth: 67, maxHeight: 20)
                    .minimumScaleFactor(0.1)
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.tertiaryColor1)
                    .padding([.horizontal], 102)
                    .padding([.vertical], 12)
            }
        })
    }
    
}

struct CustomTimesUpAlertView: View {
    
    var body: some View {
        CustomAlertViewRefactor(title: "timesUp",
                                message: "yourScribbliunsCounted",
                                actions: {
            Button {
                // TODO: navigate to results screen
            } label: {
                Text("ok")
                    .font(.custom(Font.rubikSemiboldFont, size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.tertiaryColor1)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            }
        })
    }
    
}

struct CustomAlertViewRefactor_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomLeavingAlertView(unpauseAction: {})
            .previewDisplayName("Custom Leaving Alert")
        CustomPausingAlertView(unpauseAction: {})
            .previewDisplayName("Custom Pausing Alert View")
        CustomTimesUpAlertView()
            .previewDisplayName("Custom Time's Up Alert View")
        
    }
    
}
