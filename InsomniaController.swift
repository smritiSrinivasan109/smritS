//
//  InsomniaController.swift
//  Tests For Teens
//
//  Created by SRINIVASAN Smriti on 7/20/20.
//  Copyright © 2020 Smriti Srinivasan. All rights reserved.
//

import UIKit

class InsomniaController: UIViewController {
    
   //Anxiety Test
    
    // variables
    var currentIQuestion = 0
    var ansI1 = 1
    var ansI2 = 2
    var ansI3 = 3
    var ansI4 = 4
    var scoreI = 0
    
    // label
    @IBOutlet weak var lbl: UILabel!
    
    
    
    let questionsI = ["1. I have difficulty falling asleep","2. Thoughts race through my mind and this prevents me from sleeping","3. I feel afraid to go to sleep","4. I wake up during the night and can't go back to sleep","5. I worry about things and have trouble relaxing","6. Despite sleeping all night, I don't feel refreshed when I awaken","7. Despite sleeping all night, I don't feel refreshed when I awaken","8. I lie awake for half an hour or more before I fall asleep","9. I wake in the morning with muscle or joint stiffness and aches","10. I feel sand and depressed"]
       
   let answersI = [
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"],
    ["TRUE", "FALSE"]
    ]
    
    
   
    @IBAction func action(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case ansI1:
            scoreI += 1
        case ansI2:
            scoreI += 0
        default:
            break
            
        }
        
        if (currentIQuestion != questionsI.count) {
            newIQuestion()
        } else if currentIQuestion == questionsI.count {
            endQuiz() // this will have the end result & the resources
            currentIQuestion = 0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newIQuestion()
    }
                  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    // creating the function that calls new question
    func newIQuestion() {
        
        lbl.text = questionsI[currentIQuestion]
    
        for i in 1...2{
            
            // create a button
            var button:UIButton  = view.viewWithTag(i) as! UIButton
            
            if (i == Int(ansI1)) {
                button.setTitle(answersI[currentIQuestion][0], for: .normal)
            } else if (i == Int(ansI2)) {
                button.setTitle(answersI[currentIQuestion][1], for: .normal)
            } else {
                button.setTitle(answersI[currentIQuestion][2], for: .normal)
            }
        }
        
        
        currentIQuestion += 1
    
    }
    
    func endQuiz () {
        if (scoreI >= 0 && scoreI <= 2) {
            performSegue(withIdentifier: "noInsomniaSymptoms", sender: self)
        } else if scoreI >= 4 && scoreI <= 10 {
            performSegue(withIdentifier: "insomniaSymptoms", sender: self)
        }
    }

}


