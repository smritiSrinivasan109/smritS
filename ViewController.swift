//
//  ViewController.swift
//  Tests For Teens
//
//  Created by SRINIVASAN Smriti on 7/2/20.
//  Copyright © 2020 Smriti Srinivasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // DEPRESSION TEST
    
    // variables
    var currentDQuestion = 0
    var ansD1 = 1
    var ansD2 = 2
    var ansD3 = 3
    var ansD4 = 4
    var scoreD = 0
    
    // label
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet var view1: UIView!
    
    let questionsD = ["1. Little interest or pleasure in doing things","2. Feeling down, depressed, or hopeless","3. Trouble falling or staying asleep, or sleeping too much","4. Feeling tired or having little energy","5. Poor appetite or overeating","6. Feeling bad about yourself - or that you are a failure or have let yourself or your family down","7. Trouble concentrating on things, such as reading the newspaper or watching television","8. Moving or speaking so slowly that other people could have noticed (Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual)","9. Thoughts that you would be better off dead, or of hurting yourself","10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?"]
       
   let answersD = [["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not difficult at all: 1", "Somewhat difficult: 2", "Very difficult: 3", "Extremely difficult: 4"]]
    
    
   
    @IBAction func action(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case ansD1:
            button.setTitle(answersD[currentDQuestion][0], for: .normal)
            scoreD += 0
        case ansD2:
            button.setTitle(answersD[currentDQuestion][1], for: .normal)
            scoreD += 1
        case ansD3:
            button.setTitle(answersD[currentDQuestion][2], for: .normal)
            scoreD += 2
        case ansD4:
            button.setTitle(answersD[currentDQuestion][3], for: .normal)
            scoreD += 3
        default:
            //button.setTitle(answersD[currentDQuestion][4], for: .normal)
            break
            
        }
        
        if (currentDQuestion != questionsD.count) {
            newDQuestion()
        } else if currentDQuestion >= questionsD.count {
            endQuiz() // this will have the end result & the resources
        }
        
        print(scoreD)
        
    }
   
   
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        newDQuestion()
    }
                  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    // creating the function that calls new question

    func newDQuestion() {
        print(currentDQuestion)
        print(questionsD[0])
        
        lbl.text = questionsD[currentDQuestion]
    
    
        // var button:UIButton = UIButton()
        var x = 1
    

        
        for i in 0...4 { // used to be 1...4
            
            // create a button
            
            let button:UIButton  = view.viewWithTag(i) as! UIButton
            
            if (i == Int(ansD1)) {
                button.setTitle(answersD[currentDQuestion][0], for: .normal)
                // scoreD += 0
            } else if (i == Int(ansD2)) {
                button.setTitle(answersD[currentDQuestion][1], for: .normal)
                // scoreD += 1
            } else if (i == Int(ansD3)) {
                button.setTitle(answersD[currentDQuestion][2], for: .normal)
                // scoreD += 2
            } else if (i == Int(ansD4)) {
                button.setTitle(answersD[currentDQuestion][3], for: .normal)
                // scoreD += 3
            } else {
                button.setTitle(answersD[currentDQuestion][4], for: .normal)
                // scoreD += 4
                x=2
            }
        }
        
        
        currentDQuestion += 1
    
    }
    
    func endQuiz () {
        if (scoreD >= 0 && scoreD <= 4) {
            performSegue(withIdentifier: "minimalDepression", sender: self)
            print(scoreD)
        } else if scoreD >= 5 && scoreD <= 9 {
            performSegue(withIdentifier: "mildDepression", sender: self)
            print(scoreD)
        } else if scoreD >= 10 && scoreD <= 14 {
            performSegue(withIdentifier: "moderateDepression", sender: self)
            print(scoreD)
        }  else if scoreD >= 15 && scoreD <= 19 {
            performSegue(withIdentifier: "moderatelySevereDepression", sender: self)
            print(scoreD)
        } else if scoreD >= 20  && scoreD <= 27 {
            performSegue(withIdentifier: "severeDepression", sender: self)
            print(scoreD)
        }
    }
    
    
    
    // ANXIETY TEST
    
    // variables
     var currentAQuestion = 0
     var ansA1 = 1
     var ansA2 = 2
     var ansA3 = 3
     var ansA4 = 4
     var scoreA = 0
     
     // label
     @IBOutlet weak var lblA: UILabel!
     
     @IBOutlet var view2: UIView!
     
     let questionsA = ["1. Feeling nervous, anxious, or on edge","2. Not being able to stop or control worrying","3. Worrying too much about different things","4. Trouble relaxing","5. Being so restless that it is hard to sit still","6. Becoming easily annoyed or irritable","7. Feeling afraid, as if something awful might happen","8. Moving or speaking so slowly that other people could have noticed (Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual)","9. Thoughts that you would be better off dead, or of hurting yourself","10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?"]
        
    let answersA = [["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"]]
    
    @IBAction func actionA(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case ansA1:
            button.setTitle(answersA[currentAQuestion][0], for: .normal)
            scoreA += 0
        case ansA2:
            button.setTitle(answersA[currentAQuestion][1], for: .normal)
            scoreA += 1
        case ansA3:
            button.setTitle(answersA[currentAQuestion][2], for: .normal)
            scoreA += 2
        case ansA4:
            button.setTitle(answersA[currentAQuestion][3], for: .normal)
            scoreA += 3
        default:
            //button.setTitle(answersD[currentDQuestion][4], for: .normal)
            break
            
        }
        
        if (currentAQuestion != questionsA.count) {
            newAQuestion()
        } else if currentAQuestion >= questionsA.count {
            endQuizA() // this will have the end result & the resources
        }
        
        print(scoreA)
        
    }
    
    func endQuizA () {
        if (scoreA >= 0 && scoreA <= 4) {
            performSegue(withIdentifier: "minimalAnxiety", sender: self)
            print(scoreA)
        } else if scoreA >= 5 && scoreA <= 9 {
            performSegue(withIdentifier: "mildAnxiety", sender: self)
            print(scoreA)
        } else if scoreA >= 10 && scoreA <= 14 {
            performSegue(withIdentifier: "moderateAnxiety", sender: self)
            print(scoreA)
        }  else if scoreA >= 15 && scoreA <= 19 {
            performSegue(withIdentifier: "severeDepression", sender: self)
            print(scoreA)
        }
        
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
         newAQuestion()
     }
                   
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     } */
     
    
     // creating the function that calls new question

     func newAQuestion() {
         print(currentAQuestion)
         print(questionsA[0])
         
         lblA.text = questionsA[currentAQuestion]
     
     
         // var button:UIButton = UIButton()
         var y = 1
        
         for c in 0...4 { // used to be 1...4
             
             // create a button
             
             let button:UIButton  = view.viewWithTag(c) as! UIButton
             
             if (c == Int(ansA1)) {
                 button.setTitle(answersA[currentAQuestion][0], for: .normal)
                 // scoreD += 0
             } else if (c == Int(ansA2)) {
                 button.setTitle(answersA[currentAQuestion][1], for: .normal)
                 // scoreD += 1
             } else if (c == Int(ansA3)) {
                 button.setTitle(answersA[currentAQuestion][2], for: .normal)
                 // scoreD += 2
             } else if (c == Int(ansA4)) {
                 button.setTitle(answersA[currentAQuestion][3], for: .normal)
                 // scoreD += 3
             } else {
                 button.setTitle(answersA[currentAQuestion][4], for: .normal)
                 // scoreD += 4
                 y=2
             }
         }
         
         
         currentAQuestion += 1
     
     }
    
}


