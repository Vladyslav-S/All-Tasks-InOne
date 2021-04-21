//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let story = [Story(title: "You seea fork in the road", choice1: "Take a left", choice2: "Take a right", redirection1: 1, redirection2: 2),   //0
                 
                 Story(title: "You see a tiger", choice1: "Shoutfor  help", choice2: "Play dead", redirection1: 3, redirection2: 4),             //1
                 
                 Story(title: "You find a treasure chest", choice1: "Open it.", choice2: "Check for traps.", redirection1: 3, redirection2: 4),  //2
                 
                 Story(title: "Story3", choice1: "Open 1", choice2: "Open 2", redirection1: 5, redirection2: 5),                                 //3
                 
                 Story(title: "Story4", choice1: "Open 1.2", choice2: "Open2.2", redirection1: 5, redirection2: 5),                              //4
                 
                 Story(title: "END", choice1: "Restart", choice2: "Restart", redirection1: 0, redirection2: 0)                                   //5 End of story+  refresh
    ]
    
    var storyNumber = 0

    mutating func setStory(_ userAnswer: String) {
   
        let currentStory = story[storyNumber]
        if userAnswer == currentStory.choice1 {
            storyNumber = currentStory.redirection1
        } else if userAnswer == currentStory.choice2 {
            storyNumber = currentStory.redirection2
        }
    }
    
    func setQuestionText() -> String {
        return story[storyNumber].title
    }
    func setChoice1() ->String {
        
        return story[storyNumber].choice1
    }
    func setChoice2() -> String {
        return story[storyNumber].choice2
    }
    
}
