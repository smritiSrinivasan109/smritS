//
//  AnxietyController.swift
//  Tests For Teens
//
//  Created by SRINIVASAN Smriti on 7/2/20.
//  Copyright © 2020 Smriti Srinivasan. All rights reserved.
//

import UIKit

class AnxietyController: UIViewController {
    
   //Anxiety Test
    
    // variables
    var currentAQuestion = 0
    var ansA1 = 1
    var ansA2 = 2
    var ansA3 = 3
    var ansA4 = 4
    var scoreA = 0
    
    // label
    @IBOutlet weak var lbl: UILabel!
    
    
    
    let questionsA = ["1. Feeling nervous, anxious, or on edge","2. Not being able to stop or control worrying","3. Worrying too much about different things","4. Trouble relaxing","5. Being so restless that it is hard to sit still","6. Becoming easily annoyed or irritable","7. Feeling afraid, as if something awful might happen","8. Moving or speaking so slowly that other people could have noticed (Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual)","9. Thoughts that you would be better off dead, or of hurting yourself","10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?"]
       
   let answersA = [
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"],
    ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"]
    ]
    
    
   
    @IBAction func action(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case ansA1:
            scoreA += 0
        case ansA2:
            scoreA += 1
        case ansA3:
            scoreA += 2
        case ansA4:
            scoreA += 3
        default:
            break
            
        }
        
        if (currentAQuestion != questionsA.count) {
            newAQuestion()
        } else if currentAQuestion == questionsA.count {
            endQuiz() // this will have the end result & the resources
            currentAQuestion=0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newAQuestion()
    }
                  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    // creating the function that calls new question
    func newAQuestion() {
        
        lbl.text = questionsA[currentAQuestion]
    
        for i in 1...4{
            
            // create a button
            let button:UIButton  = view.viewWithTag(i) as! UIButton
            
            if (i == Int(ansA1)) {
                button.setTitle(answersA[currentAQuestion][0], for: .normal)
            } else if (i == Int(ansA2)) {
                button.setTitle(answersA[currentAQuestion][1], for: .normal)
          
            } else if (i == Int(ansA3)) {
                button.setTitle(answersA[currentAQuestion][2], for: .normal)
             
            } else if (i == Int(ansA4)) {
                button.setTitle(answersA[currentAQuestion][3], for: .normal)
            } else {
                button.setTitle(answersA[currentAQuestion][4], for: .normal)
            }
        }
        
        
        currentAQuestion += 1
    
    }
    
    func endQuiz () {
        if (scoreA >= 0 && scoreA <= 4) {
            performSegue(withIdentifier: "minimalAnxiety", sender: self)
        } else if scoreA >= 5 && scoreA <= 9 {
            performSegue(withIdentifier: "mildAnxiety", sender: self)
        } else if scoreA >= 10 && scoreA <= 14 {
            performSegue(withIdentifier: "moderateAnxiety", sender: self)
        }  else if scoreA >= 15 && scoreA <= 19 {
            performSegue(withIdentifier: "severeAnxiety", sender: self)
        }

        }

}


