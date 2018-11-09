//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Hameed Abdullah on 11/5/18.
//  Copyright © 2018 Hameed Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    //Fatal error
    //“Remember that you can only access an index if that index exists in the array. Otherwise there will be an “Index out of range” error.
    //To implement this behavior without causing a crash, you’ll need to detect when you’ve arrived at the end of the list. At that point, instead of incrementing the index, you’ll set the index to the start of the list.
    ///“You can use the count property of the elementList array to help make this decision in your code:”

    

    var currentElementIndex = 0
    
    @IBOutlet weak var showAnswer: UIButton!
    @IBOutlet weak var nextElement: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //When the app first launches, you’ll display the first element. You’ll also need to update which element is displayed when the user clicks the Next Element button. You can combine the core logic for both of these steps into a single method
        
        updateElement()
    }
    

    func updateElement() {
        //The line below sets the text of the answer label to a question mark. The app will display the actual answer when the Show Answer button is tapped
        answerLabel.text = "?"

        //currentElementIndex accesses the element name from the list
        questionLabel.text = "\(elementList[currentElementIndex].symbol)\n \(elementList[currentElementIndex].atomicNumber)"
        showAnswer.isEnabled = true
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        //To actually show the answer, you’ll access the element name for the element at the current index and set that as the text of the answerLabel.
    
        answerLabel.text = elementList[currentElementIndex].name
        showAnswer.isEnabled = false
        nextElement.isEnabled = true
    }
    

    @IBAction func goToNextElement(_ sender: Any) {
        
        currentElementIndex += 1
        
        // to go back to the beginning of the list when the user gets to the last element and taps the Next Element button.
        if currentElementIndex >= elementList.count {
            //2. we set it back to 0
            currentElementIndex = 0
        }
        
        //call the updateElement() to update the user interface to display the element at the new current index
        updateElement()
        nextElement.isEnabled = false
    }
    
    
}

