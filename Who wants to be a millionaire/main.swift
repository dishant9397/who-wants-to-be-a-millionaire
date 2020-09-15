//
//  main.swift
//  Who wants to be a millionaire
//
//  Created by Dishant Patel on 2020-03-09.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import Foundation

var name:String?
var difficultyLevel:Int = 0
var game:Game
var question:Question
var questionList:[Question] = [Question]()
var userAnswer,correctAnswer,optionAnswer,continueAnswer:Character
var rounds = [[Int]]()
var stopGame:Bool = false
var isUsedM,isUsedP,isUsedF,canUseLifeline:Bool
var questionIndex:Int
var countQuestions:Int
var countRounds:Int
var maximumQuestions:Int
var continueLoop, continueGame:Bool
var round1,round2,round3:[Int]

while true {
    continueGame = true
    countRounds = 1
    countQuestions = 0
    isUsedP = false
    isUsedF = false
    isUsedM = false
    canUseLifeline = false
    print("Let's start the game!!")
    print("Who wants to be a Millionaire")
    print("Enter your name: ",terminator:"")
    name = String(readLine()!)
    if name != "" {
        game = Game(questionList: questionList)
        questionList = game.createQuestions()
        print()
        print("Select the Difficulty Level")
        print("1.Easy   2.Hard")
        difficultyLevel = Int(readLine()!)!
        print()
        if difficultyLevel != 1 && difficultyLevel != 2 {
            print("Please enter the correct difficulty Level.")
        }
        else {
            if difficultyLevel == 1 {
                canUseLifeline = true
                maximumQuestions = 3
                round1 = [100, 500, 1000]
                round2 = [8000, 16000, 32000]
                round3 = [125000, 500000, 1000000]
                rounds = [round1, round2, round3]
            }
            else {
                maximumQuestions = 5
                round1 = [100, 200, 300, 500, 1000]
                round2 = [2000, 4000, 8000, 16000, 32000]
                round3 = [64000, 125000, 250000, 500000, 1000000]
                rounds = [round1, round2, round3]
            }
            print("Note: Use one of the following options anytime in the game for using the lifelines.")
            print("M.Phone a friend    F.50-50    P.Audience Poll")
            print()
            while true {
                if continueGame == false {
                    break
                }
                continueLoop = false
                (correctAnswer, question) = game.displayQuestion(questionList: questionList)
                while true {
                    if continueLoop == true {
                        break
                    }
                    print("Enter your answer: ", terminator:"")
                    userAnswer = Character(readLine()!)
                    print()
                    if userAnswer == "m" || userAnswer == "M" {
                        if !isUsedM && canUseLifeline {
                            game.implementPhoneAFriend()
                            isUsedM = true
                        }
                        else {
                            print("Sorry!! You cannot use this lifeline or it has been already used.")
                            print()
                        }
                    }
                    else if userAnswer == "f" || userAnswer == "F" {
                        if !isUsedF && canUseLifeline {
                            game.implementFiftyFifty(question:question)
                            isUsedF = true
                        }
                        else {
                            print("Sorry!! You cannot use this lifeline or it has been already used.")
                            print()
                        }
                    }
                    else if userAnswer == "p" || userAnswer == "P" {
                        if !isUsedP && canUseLifeline {
                            game.implementAudiencePoll(question:question)
                            isUsedP = true
                        }
                        else {
                            print("Sorry!! You cannot use this lifeline or it has been already used.")
                            print()
                        }
                    }
                    else {
                        while true {
                            print("Do you want to confirm the choice you selected?")
                            print("Y.Yes   N.No")
                            optionAnswer = Character(readLine()!)
                            if optionAnswer == "y" || optionAnswer == "Y" {
                                continueLoop = true
                                break
                            }
                            else if optionAnswer == "n" || optionAnswer == "N" {
                                optionAnswer = "a"
                                continueLoop = false
                                break
                            }
                            else {
                                print("Invalid character entered.")
                                continue
                            }
                        }
                        print()
                        if !continueLoop {
                            continue
                        }
                    }
                    if userAnswer == "a" || userAnswer == "b" || userAnswer == "c" || userAnswer == "d" || userAnswer == "A" || userAnswer == "B" || userAnswer == "C" || userAnswer == "D" {
                        if userAnswer == correctAnswer {
                            questionList =  game.removeQuestion(questionList: questionList)
                            continueLoop = true
                            game.winningAmount = rounds[countRounds-1][countQuestions]
                            print("Congratulations!! You have won $\(game.winningAmount)")
                            print()
                            countQuestions += 1
                            if countQuestions == maximumQuestions {
                                canUseLifeline = true
                                print("Congratulations!! You have passed Round-\(countRounds) ")
                                print()
                                if countRounds == 3 {
                                    continueGame = false
                                    questionList.removeAll()
                                    game.declareWinner()
                                    print()
                                    break
                                }
                                countQuestions=0
                                countRounds += 1
                                print("Do you want to continue playing the game or want to back-off?")
                                print("Y.Yes   N.No")
                                continueAnswer = Character(readLine()!)
                                print()
                                if continueAnswer == "y" || continueAnswer == "Y" {
                                    break
                                }
                                else if continueAnswer == "n" || continueAnswer == "N" {
                                    continueGame = false
                                    questionList.removeAll()
                                    game.declareWinner()
                                    print()
                                    break
                                }
                            }
                        }
                        else {
                            continueGame = false
                            questionList.removeAll()
                            print("Sorry!! You have lost the game.")
                            break
                        }
                    }
                    else if userAnswer == "m" || userAnswer == "M" || userAnswer == "f" || userAnswer == "F" || userAnswer == "p" || userAnswer == "P" {
                    }
                    else {
                        continueLoop = false
                        print("No or wrong input from the user")
                        print()
                        continue
                    }
                }
                continue
            }
        }
    }
    else {
        print()
        print("Please enter the name.")
    }
    print()
}

