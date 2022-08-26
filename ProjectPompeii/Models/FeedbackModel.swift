//
//  FeedbackModel.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 25/08/22.
//

import Foundation

struct FeedbackModel {
    
    public static func getRandomFeedback() -> String {
        
        let phrases = ["Is it an apple?", "Is it an orange?", "Is it a sun?", "Is it a moon?", "Is it a door?", "Is it a chair?", "Is it a dog?", "Is it a cat?", "Is it a book?", "Is it a pencil?"]
        
        return phrases.randomElement() ?? "Is it a banana?"
        
    }
    
}
