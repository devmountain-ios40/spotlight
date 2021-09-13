//
//  StephenViewController.swift
//  Spotlight
//
//  Created by Andrew Saeyang on 9/13/21.
//

import UIKit

class StephenViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var bioTextLabel: UILabel!
    @IBOutlet weak var linkedInButoon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        linkedInButoon.layer.cornerRadius = 8
        
        
    }
    
    func setupViews(){
        
        let person = PersonController.shared.persons[3]
        
        bioTextLabel.text = person.bio
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Identifier
        if segue.identifier == "stephen"{
            
            
            // Destination
            guard let destination = segue.destination as? CustomWebViewController else { return }
            
          
            destination.person = PersonController.shared.persons[3]
            
        }
    }

}
