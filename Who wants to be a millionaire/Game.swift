//
//  Game.swift
//  Who wants to be a millionaire
//
//  Created by Dishant Patel on 2020-03-09.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import Foundation

class Game {
    
    var questionList:[Question]
    var randomNumber:Int = 0
    var winningAmount:Int = 0
    
    init(questionList:[Question]) {
        self.questionList = questionList
    }
    
    func createQuestions() -> [Question] {
        questionList.append(Question(question: "Which of the following is in Canada?", a: "Taj Mahal", b: "Lotus Temple", c: "Eiffel Tower", d: "Niagara Falls", correctAnswer: "d"))
        questionList.append(Question(question: "Which of the following is not available in an online store?", a: "Trimmer", b: "Washing Machine", c: "Car", d: "Medicines", correctAnswer: "c"))
        questionList.append(Question(question: "Which is the first trillion company?", a: "Apple", b: "Walmart", c: "Amazon", d: "Google", correctAnswer: "a"))
        questionList.append(Question(question: "What is the national fruit in Japan?", a: "Banana", b: "Broccoli", c: "Grapes", d: "Apple", correctAnswer: "b"))
        questionList.append(Question(question: "Which of the following is in Canada?", a: "Cricket", b: "Sumo Wrestling", c: "Hockey", d: "Badminton", correctAnswer: "b"))
        questionList.append(Question(question: "How long is an Olympic swimming pool?", a: "20 metres", b: "35 metres", c: "50 metres", d: "65 metres", correctAnswer: "c"))
        questionList.append(Question(question: "How many players has a hockey team got on the ice?", a: "5", b: "6", c: "7", d: "8", correctAnswer: "b"))
        questionList.append(Question(question: "In which sport can you win the Davis Cup?", a: "Tennis", b: "Badminton", c: "Basketball", d: "Soccer", correctAnswer: "a"))
        questionList.append(Question(question: "Which vegetable can be sweet or bitter?", a: "Saalt", b: "Sugar", c: "Pepper", d: "None of the above", correctAnswer: "c"))
        questionList.append(Question(question: "How do pineapples grow?", a: "Under the ground", b: "Over the ground", c: "On the ground", d: "3 foot above the ground", correctAnswer: "c"))
        questionList.append(Question(question: "Which fruit tree is considered to be sacred in India?", a: "Apple", b: "Kiwi", c: "Banana", d: "Mango", correctAnswer: "d"))
        questionList.append(Question(question: "What is the national animal of Canada?", a: "North American Beaver", b: "Golden Eagle", c: "Whale", d: "Elephant", correctAnswer: "a"))
        questionList.append(Question(question: "In what year was Google launched on the web?", a: "1995", b: "1996", c: "1997", d: "1998", correctAnswer: "d"))
        questionList.append(Question(question: "Which unit is an indication for the sound quality of MP3?", a: "kbps", b: "mbps", c: "gbps", d: "None of the above", correctAnswer: "a"))
        questionList.append(Question(question: "What color is cobalt?", a: "Blue", b: "White", c: "Black", d: "Red", correctAnswer: "a"))
        return questionList
    }
    
    func displayQuestion(questionList:[Question]) ->  (Character, Question) {
        self.randomNumber = Int.random(in: 0..<questionList.count)
        print(questionList[randomNumber].question)
        print("A: \(questionList[randomNumber].a)")
        print("B: \(questionList[randomNumber].b)")
        print("C: \(questionList[randomNumber].c)")
        print("D: \(questionList[randomNumber].d)")
        return (questionList[self.randomNumber].correctAnswer, questionList[self.randomNumber])
    }
    
    func removeQuestion(questionList:[Question]) -> ([Question]) {
        self.questionList = questionList
        self.questionList.remove(at: self.randomNumber)
        return self.questionList
    }
    
    func declareWinner() {
        print("Congratulations!! The game is completed and you have won $\(self.winningAmount)")
    }
    
    func createRandomArray() -> [Int] {
        var i = 0
        var random = [Int]()
        while true{
            let number = Int.random(in: 1...4)
            if i == 4 {
                break
            }
            if random.contains(number) {
                continue
            }
            else {
                i += 1
                random.append(number)
            }
        }
        return random
    }
    
    func implementPhoneAFriend() {
        let number:Int = Int.random(in: 1...4)
        if number == 1 {
            print("Correct Option can be Option-A")
        }
        else if number == 2 {
            print("Correct Option can be Option-B")
        }
        else if number == 3 {
            print("Correct Option can be Option-C")
        }
        else {
            print("Correct Option can be Option-D")
        }
        print()
    }
    
    func implementFiftyFifty(question:Question) {
        var count:Int = 0
        let answer = createRandomArray()
        let dictionary:[Int:Character] = [1:"a",2:"b",3:"c",4:"d"]
        for number in answer {
            if count == 2 {
                break
            }
            if dictionary[number] != question.correctAnswer {
                count += 1
                if dictionary[number] == "a" {
                    question.a = ""
                }
                else if dictionary[number] == "b" {
                    question.b = ""
                }
                else if dictionary[number] == "c" {
                    question.c = ""
                }
                else if dictionary[number] == "d" {
                    question.d = ""
                }
            }
        }
        print(question.question)
        print("A: \(question.a)")
        print("B: \(question.b)")
        print("C: \(question.c)")
        print("D: \(question.d)")
        print()
    }
    
    func implementAudiencePoll(question:Question) {
        var answer = [Character:Int]()
        let number1 = Int.random(in: 40...50)
        let number2 = Int.random(in: 20...25)
        let number3 = Int.random(in: 10...15)
        let number4 = 100 - number1 - number2 - number3
        answer[question.correctAnswer] = number1
        if question.correctAnswer == "a" {
            answer["b"] = number2
            answer["c"] = number3
            answer["d"] = number4
        }
        else if question.correctAnswer == "b" {
            answer["a"] = number2
            answer["c"] = number3
            answer["d"] = number4
        }
        else if question.correctAnswer == "c" {
            answer["a"] = number3
            answer["b"] = number2
            answer["d"] = number4
        }
        else {
            answer["a"] = number4
            answer["b"] = number2
            answer["c"] = number3
        }
        print("Audience Poll Results:")
        print("A: \(answer["a"] ?? 0)%")
        print("B: \(answer["b"] ?? 0)%")
        print("C: \(answer["c"] ?? 0)%")
        print("D: \(answer["d"] ?? 0)%")
        print()
    }
}



