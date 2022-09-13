//
//  CustomAlertView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 09/09/22.
//

import SwiftUI

struct CustomAlertView: View {
    
    @Binding var shown: Bool
    //@State private var info = [AlertModel]()
    
    var body: some View {
        VStack {
            Text("Oops! :(")
                .font(.custom("Rubik-SemiBold", size: 17))
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("This is not the instructed drawing. Try again!")
                .fixedSize(horizontal: false, vertical: true)
                .font(.custom("Rubik-Regular", size: 13))
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .foregroundColor(Color("TertiaryColor-1"))
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertTimeUp: View {
    
    @Binding var shown: Bool
    //@State private var info = [AlertModel]()
    
    var body: some View {
        VStack {
            Text("Your time's up!")
                .font(.custom("Rubik-SemiBold", size: 17))
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("Your scribbliums have been counted!")
                .font(.custom("Rubik-Regular", size: 13))
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .foregroundColor(Color("TertiaryColor-1"))
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertTutorial: View {
    
    @Binding var shown: Bool
    //@State private var info = [AlertModel]()
    
    var body: some View {
        VStack {
            Text("NOOOOOO")
                .font(.custom("Rubik-SemiBold", size: 17))
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("Bluetooth is turned off, to join a game you must turn it on!")
                .font(.custom("Rubik-Regular", size: 13))
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .foregroundColor(Color("TertiaryColor-1"))
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
    //@State private var info = [AlertModel]()
    
    var body: some View {
        VStack {
            Text("Oops!")
                .font(.custom("Rubik-SemiBold", size: 17))
                .padding([.vertical], 12)
                .foregroundColor(Color("TertiaryColor-1"))
            Text("You can't proceed with an empty drawing!")
                .font(.custom("Rubik-Regular", size: 13))
                .foregroundColor(Color("TertiaryColor-1"))
                .multilineTextAlignment(.center)
                .padding([.horizontal], 32)
            Divider()
            Button {
                shown.toggle()
            } label: {
                Text("Ok")
                    .font(.custom("Rubik-SemiBold", size: 17))
                    .foregroundColor(Color("TertiaryColor-1"))
            }
        }
        .frame(width: UIScreen.main.bounds.width-120, height: 136)
        .background(Color(UIColor(red: 1.00, green: 0.98, blue: 0.51, alpha: 1.00)))
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3).foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00))))
        .cornerRadius(15)
        .clipped()
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(shown: .constant(false))
    }
}
