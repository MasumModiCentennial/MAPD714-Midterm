//
//  AddShoppingListViewController.swift
//  ShoppingList
//
//  Created by Masum Modi on 2020-10-28.
//  Copyright © 2020 Centennial College. All rights reserved.
//  Student Id: 301149321


import UIKit

class AddShoppingListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtListname: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide keyboard
        self.txtListname.delegate = self
        
        //Bind data to table view
        self.tableView.dataSource = self
        
        //Apply Shadow to buttons
        setButtonShadow(self.btnSave)
        setButtonShadow(self.btnCancel)
    }
    
    // Set Shadow Size, Color and Radius
    func setButtonShadow(_ button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
    }
    
    //Clear all cells on cancel button clicked
    @IBAction func onCancelClicked(_ sender: UIButton) {
        self.tableView.visibleCells.forEach { (cell) in
            if let itemCell = cell as? AddItemCell{
                itemCell.lblItemCount.text = "0"
                itemCell.txtEnterItem.text = ""
            }
        }
        self.txtListname.text = ""
    }
}

// Table view data source controller
extension AddShoppingListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Returns number of rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddItemCell", for: indexPath) //Find the cell and recycle it
        return cell
    }
}

//  Hide keyboard extension
extension AddShoppingListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

