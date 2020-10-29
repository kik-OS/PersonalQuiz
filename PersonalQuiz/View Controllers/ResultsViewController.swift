//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController:
    UIViewController {
    
    @IBOutlet var typeOfAnimalLabel: UILabel!
    @IBOutlet var descriptionOfAnimal: UILabel!
    
    var resultsFromQuestionVC : [Answer] = []
    private var animalResultType: AnimalType = .dog
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteringArray(array: resultsFromQuestionVC)
        showResultsOnLabels()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    private func filteringArray(array: [Answer]) {
        let mappedItems = array.map { ($0.type, 1) }
        let countsOfRepeating = Dictionary(mappedItems, uniquingKeysWith: +)
        let animal = ((Array(countsOfRepeating).sorted {$0.1 > $1.1}).first?.key)!
        animalResultType = animal
    }
    
    private func showResultsOnLabels() {
        for answer in resultsFromQuestionVC {
            if answer.type == animalResultType {
                typeOfAnimalLabel.text = "Вы - " + String(answer.type.rawValue) + "!"
                descriptionOfAnimal.text = answer.type.definition
            }
        }
    }
}
