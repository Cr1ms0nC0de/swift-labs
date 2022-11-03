//
//  Destiny.swift
//  Destiny
//
//  Created by Wilkins, Nolan W on 9/14/22.
//

import Foundation

struct Destiny{
    var currentStory : Int = 0
    
    let stories = [Story(title: "You see a fireplace, do you go there?", choice1: "Yes", choice1index: 1, choice2: "No", choice2index: 2), //0
        Story(title: "You see a lever", choice1: "Pull it", choice1index: 3, choice2: "Don't pull it", choice2index: 2), //1
        Story(title: "You get bored", choice1: "The", choice1index: 0, choice2: "End", choice2index: 0), //2
        Story(title: "A secret door opens, do you go through?", choice1: "Yes", choice1index: 4, choice2: "No", choice2index: 2), //3
        Story(title: "You see gold, do you take it?", choice1: "Yes",
            choice1index: 5, choice2: "No", choice2index: 2), //4
        Story(title: "You become rich", choice1: "The", choice1index: 0, choice2: "End", choice2index: 0) //5
    ]
        
    func returnTitle() -> String{
        return stories[currentStory].title
    }
    func returnChoice1() -> String{
        return stories[currentStory].choice1
    }
    func returnChoice2() -> String{
        return stories[currentStory].choice2
    }
}
