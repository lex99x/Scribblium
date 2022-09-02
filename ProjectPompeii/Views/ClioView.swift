//
//  ClioView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 25/08/22.
//

import SwiftUI

struct ClioView: View {
    
    @State private var number = PercentualModel.getRandomPercentual()
    @State var isAnimated: Bool = true

    var body: some View {
        
        //Fundo padrao: cor e asset da Clio (personagem + estrelas)
        
        ZStack(alignment: .center) {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()
            
            Image("padraoPortrait")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            if(number == "0%" || number == "25%"){
                
                Image("Clio negativa olhos abertos darkmode")
                    .ignoresSafeArea()
                    .frame(width: 391, height: 600.16)
                    .offset(y: -106)
                    //.aspectRatio(contentMode: .fit)
            }
            else {
                Image("Clio stars olhos abertos darkmode")
                    .ignoresSafeArea()
                    .frame(width: 391, height: 600.16)
                    .offset(y: -106)
            }
                
            VStack(alignment: .center){
                
                if(number == "0%" || number == "25%"){

                    Text("Hi, I'm CLE/O and I brought some BAD news...")
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .font(.custom("RubikMarkerHatch-Regular", size: 32))
                        .frame(width: 295, height: 114)
                        .multilineTextAlignment(.center)
                        .offset(y: -90)

                    Text("You were ELIMINATED because you reached")
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .font(.system(size: 20))
                        .frame(width: 336, height: 48)
                        .multilineTextAlignment(.center)
                        .offset(y: 220)
                }
                else{
                    Text("Hi, I'm CLE/O and I brought some GOOD news!")
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .font(.custom("RubikMarkerHatch-Regular", size: 32))
                        .frame(width: 295, height: 114)
                        .multilineTextAlignment(.center)
                        .offset(y: -90)

                    Text("Congratulations you ADVANCED to the next round by achieving")
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .font(.system(size: 20))
                        .frame(width: 336, height: 48)
                        .multilineTextAlignment(.center)
                        .offset(y: 220)
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 33.24)
                        .frame(width: 342, height: 66.48)
                        .foregroundColor(Color(UIColor(red: 1.00, green: 0.76, blue: 0.78, alpha: 1.00)))
                        .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    
                    if(number == "0%") {
                        RoundedRectangle(cornerRadius: 33.24)
                            .frame(width: 0, height: 66.48)
                            .foregroundColor(Color("progressBar"))
                            .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    }
                    else if(number == "25%") {
                        RoundedRectangle(cornerRadius: 33.24)
                            .frame(width: 144, height: 66.48)
                            .foregroundColor(Color("progressBar"))
                            .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    }
                    else if(number == "50%") {
                        RoundedRectangle(cornerRadius: 33.24)
                            .frame(width: 190, height: 66.48)
                            .foregroundColor(Color("progressBar"))
                            .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    }
                    else if(number == "75%"){
                        RoundedRectangle(cornerRadius: 33.24)
                            .frame(width: 258, height: 66.48)
                            .foregroundColor(Color("progressBar"))
                            .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    }
                    else {
                        RoundedRectangle(cornerRadius: 33.24)
                            .frame(width: 258, height: 66.48)
                            .foregroundColor(Color("progressBar"))
                            .overlay(RoundedRectangle(cornerRadius: 33.24).strokeBorder(Color("Contorno"), lineWidth: 3))
                    }
                    
                    Text(number)
                        .frame(width: 87, height: 33)
                        .font(.custom("RubikMarkerHatch-Regular", size: 32))
                        .foregroundColor(Color("percentualColor"))
                        .offset(x: 140)
                    
                }
                .offset(y: 240)
                
                Text("similarity in your drawing")
                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    .font(.custom("Rubik-Italic-VariableFont_wght", size: 20))
                    .frame(width: 271, height: 24)
                    .multilineTextAlignment(.center)
                    .offset(y: 250)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
    }
}

struct ClioView_Previews: PreviewProvider {
    static var previews: some View {
        ClioView()
            .preferredColorScheme(.light)
            
    }
}
