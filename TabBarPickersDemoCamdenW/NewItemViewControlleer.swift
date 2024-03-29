//
//  NewItemViewControlleer.swift
//  TabBarPickersDemoCamdenW
//
//  Created by Camden Webster on 2/20/24.
//

import UIKit

class NewItemViewController: UIViewController, UITextFieldDelegate {
    
    let dateFormatter: DateFormatter = DateFormatter()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var sizeControl: UISegmentedControl!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var dueLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryButtonMenu: UIButton!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var newTaskButton: UIButton!
    
    var toDo = ToDo(id: 0, title: nil, start: .now, due: .now, size: .medium, priority: .medium, difficulty: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleTextField.becomeFirstResponder()
        titleTextField.delegate = self
        newTaskButton.setTitle("Add", for: UIControl.State.normal)
        // Set up segemented controls
        sizeControl.selectedSegmentIndex = 1
        difficultyControl.selectedSegmentIndex = 1
        priorityControl.selectedSegmentIndex = 1
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }

    @IBAction func sizeControlTapped(_ sender: UISegmentedControl) {
        switch sizeControl.selectedSegmentIndex {
        case 0:
            toDo.size = .small
        case 1:
            toDo.size = .medium
        case 2:
            toDo.size = .large
        default: toDo.size = .medium
        }
        print("Set task size to \(toDo.size)")
    }
    
    @IBAction func startDatePicker(_ sender: UIDatePicker) {
        toDo.start = startDatePicker.date
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        print ("Setting start date to \(dateFormatter.string(from: toDo.start ?? .now))")
    }
    
    @IBAction func dueDatePicker(_ sender: UIDatePicker) {
        toDo.due = dueDatePicker.date
        dateFormatter.dateStyle = .short 
        dateFormatter.timeStyle = .short
        print ("Setting due date to \(dateFormatter.string(from: toDo.due ?? .now))")
    }
    
    @IBAction func difficultyControlTapped(_ sender: UISegmentedControl) {
        switch difficultyControl.selectedSegmentIndex {
        case 0:
            toDo.difficulty = .low
        case 1:
            toDo.difficulty = .medium
        case 2:
            toDo.difficulty = .high
        default: toDo.difficulty = .medium
        }
        print("Set task difficulty to \(toDo.difficulty)")
    }
    
    @IBAction func priorityControlTapped(_ sender: UISegmentedControl) {
        switch priorityControl.selectedSegmentIndex {
        case 0:
            toDo.priority = .low
        case 1:
            toDo.priority = .medium
        case 2:
            toDo.priority = .high
        default: toDo.priority = .medium
        }
        print("Set task priority to \(toDo.priority)")
    }
    
    @IBAction func categoryMenuTapped(_ sender: UIButton) {
        // TODO:
    }
    
    @IBAction func newTaskButtonTapped(_ sender: UIButton) {
        guard let text = titleTextField.text, !text.isEmpty else {
            // Set up alert to be thrown if no title is entered
            let alert = UIAlertController(title: "Title Required", message: "Please provide a title for the task", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
                //Just dismiss the action sheet
            })
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        // If a value wss entered we'll log it and close the sheet
        toDo.title = titleTextField.text
        print("Setting title to \(toDo.title ?? "New Task")")
        dismiss(animated: true, completion: nil)
    }
}
