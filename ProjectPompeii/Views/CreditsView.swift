//
//  CreditsView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            
            VStack {
            
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.secondaryColor1)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.contorno, lineWidth: 2))
                            .font(.system(size: 30))
                            .background(
                                Circle()
                                    .foregroundColor(.tertiaryColor1)
                            )
                    }
                }
                .padding([.top], 15)
                .padding([.trailing], 15)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Text("credits")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Black", size: 20))
                    .foregroundColor(.secondaryColor1)
                    .padding(.top)
                
            }
            .padding(.bottom)
            
            VStack {
            
                Text("uiDesigner")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("Matheus da Silva Souza")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("appDevs")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                
                Text("Alex A. Rocha\nAna Kiara Medeiros Braga")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("Apple/Turi Create")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("Copyright 2018 Apple Inc.\n Redistribution and use in source and binary forms, with or without modification, are permitted as long as the pre-established conditions are met.\n https://github.com/apple/turicreate/blob/main/LICENSE.md")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("Quick Draw Dataset")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("Made available by Google, Inc.\nunder the Creative Commons Attribution\n4.0 International license.\nhttps://creativecommons.org/licenses/by/4.0/")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("Rubik Marker Hatch Font")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("Copyright 2020 The Rubik Filtered Project Authors\n(https://github.com/NaN-xyz/Rubik-Filtered)\nThis Font Software is licensed under the\nSIL Open Font License, Version 1.1.\nWhich is available with a FAQ at:\nhttp://scripts.sil.org/OFL")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("Rubik Font")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("Copyright 2015 The Rubik Project Authors\n(https://github.com/googlefonts/rubik)\nThis Font Software is licensed under the SIL Open Font\nLicense, Version 1.1.\nThis license is available with the FAQ at:\nhttp://scripts.sil.org/OFL")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding(.bottom)
            .padding([.horizontal], 26)
            
            VStack {
            
                Text("Simibac/ConfettiSwiftUI")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Bold", size: 17))
                    .foregroundColor(.textPaper)
                                     
                Text("MIT License Copyright 2020 Simon Bachmann,\n permission is hereby granted, free of charge, to any\n person obtaining a copy of this software and\n associated documentation files.\n https://github.com/simibac/ConfettiSwiftUI/blob/master/LICENSE")
                    .multilineTextAlignment(.center)
                    .font(.custom("Rubik-Regular", size: 13))
                    .foregroundColor(.textPaper)
                                     
            }
            .padding([.horizontal], 26)
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundDrawView)
        
    }
    
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
