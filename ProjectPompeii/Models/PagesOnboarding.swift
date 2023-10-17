//
//  PagesOnboarding.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 14/06/23.
//

import Foundation

enum Page: CaseIterable {

    case pageZero

    case pageOne

    case pageTwo

    var title: String {

        switch self {

        case .pageZero:

            return "Bem-vindo ao Scribblium!"

        case .pageOne:

            return "Conheça a nossa AI CLE/O"

        case .pageTwo:

            return "Saiba mais sobre sua pontuação!"

        }

    }
    
    var subtitle: String {

        switch self {

        case .pageZero:

            return "Um jogo de desenho rápido e divertido.  Aqui só temos uma regra... Desenhe o máximo de scribbliuns que conseguir em 30 segundos!"

        case .pageOne:

            return "(Entidade de Aprendizado Criativo a Bordo)\nEla avalia em tempo real se o que você está desenhando corresponde ao que foi pedido."

        case .pageTwo:

            return "No final de cada rodada, você pontua de acordo com: a dificuldade do desenho, a velocidade em que você desenha e a quantidade de scribbliuns."

        }

    }

    var image: String {

        switch self {

        case .pageZero:

            return "Onboarding1"

        case .pageOne:

            return "Onboarding2"

        case .pageTwo:

            return "Onboarding3"

        }

    }

    var index: Int {

        switch self {

        case .pageZero:

            return 0

        case .pageOne:

            return 1

        case .pageTwo:

            return 2

        }

    }

}
