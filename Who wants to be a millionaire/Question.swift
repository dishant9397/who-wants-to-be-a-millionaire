//
//  Questions.swift
//  Who wants to be a millionaire
//
//  Created by Dishant Patel on 2020-03-09.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import Foundation

class Question {
    
    var question,a,b,c,d:String
    var correctAnswer:Character
    
    init(question:String, a:String, b:String, c:String, d:String, correctAnswer:Character) {
        self.question = question
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.correctAnswer = correctAnswer
    }
}
