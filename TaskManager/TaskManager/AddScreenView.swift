//
//  EditViewController.swift
//  TaskManager
//
//  Created by Ярослав Швець on 26.07.2023.
//

import UIKit

protocol AddScreenViewDelegate : AnyObject {
    func addTask(_ task: Task)
}

class AddScreenView : UIViewController{
    
    weak var delegate : AddScreenViewDelegate?
    
    @IBOutlet weak var textField: UITextField!
   
    @IBAction func cancelButtonClick(_ sender: Any) {
        
        self.dismiss(animated: true)

    }
    @IBAction func addCellButtonClick(_ sender: Any) {
        let task = Task(name: textField.text!, state: false)
        delegate?.addTask(task)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
