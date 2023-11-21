//
//  CustomAlertView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 26/09/23.
//

import SwiftUI

enum CustomAlertType {
    case leaving, pausing, timesUp
}

struct CustomAlertView<Content: View>: View {
    
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let actions: () -> Content
    
    init(title: LocalizedStringKey,
         message: LocalizedStringKey,
         @ViewBuilder actions: @escaping () -> Content) {
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
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var drawingViewModel: DrawingViewModel
    
    var body: some View {
        CustomAlertView(title: "pleaseWait",
                                message: "ifYouLeaveNow",
                                actions: {
            HStack {
                Button {
                    dismiss()
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
                    drawingViewModel.unpauseAction()
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
    
    @ObservedObject var drawingViewModel: DrawingViewModel
    
    var body: some View {
        CustomAlertView(title: "pausedGame",
                                message: "youPausedGame",
                                actions: {
            Button {
                drawingViewModel.unpauseAction()
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
    
    @ObservedObject var drawingViewModel: DrawingViewModel
    
    var body: some View {
        CustomAlertView(title: "timesUp",
                                message: "yourScribbliunsCounted",
                                actions: {
            NavigationLink(destination: {
                CleoView(drawingViewModel: drawingViewModel)
            }, label: {
                Text("ok")
                    .font(.custom(Font.rubikSemiboldFont, size: 17))
                    .frame(maxWidth: 22, maxHeight: 20)
                    .fixedSize(horizontal: true, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.tertiaryColor1)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal], 124)
                    .padding([.vertical], 11)
            })
            .isDetailLink(false)
        })
    }
    
}

struct CustomAlertViewRefactor_Previews: PreviewProvider {
    
    static var previews: some View {
    
        CustomLeavingAlertView(drawingViewModel: DrawingViewModel())
            .previewDisplayName("Custom Leaving Alert")
        CustomPausingAlertView(drawingViewModel: DrawingViewModel())
            .previewDisplayName("Custom Pausing Alert View")
        CustomTimesUpAlertView(drawingViewModel: DrawingViewModel())
            .previewDisplayName("Custom Time's Up Alert View")
        
    }
    
}
