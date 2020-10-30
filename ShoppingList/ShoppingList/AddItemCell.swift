//
//  AddItemCell.swift
//  ShoppingList
//
//  Created by Masum Modi on 2020-10-30.
//  Copyright © 2020 Centennial College. All rights reserved.
//  Student Id: 301149321

import UIKit

class AddItemCell: UITableViewCell {

    @IBOutlet weak var txtEnterItem: UITextField!
    @IBOutlet weak var lblItemCount: UILabel!
    @IBOutlet weak var stepperButton: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Hide keyboard
        self.txtEnterItem.delegate = self
        
        //Bind stepper update method
        self.stepperButton.addTarget(self, action: #selector(self.updateCounterValue(sender:)), for: UIControl.Event.valueChanged)
    }
    
    // Set updated counter value to label
    @objc func updateCounterValue(sender:UIStepper){
        self.lblItemCount.text = "\(Int(sender.value))"
    }
}

//  Hide keyboard extension
extension AddItemCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
