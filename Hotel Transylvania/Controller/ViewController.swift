//
//  ViewController.swift
//  Hotel Transylvania
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adultsTextField: UITextField!
    @IBOutlet weak var childrenTextField: UITextField!
    @IBOutlet weak var infantsTextField: UITextField!

    var selectedAdultsIndex = 0
    var selectedAdultsNumber:String!
    
    var selectedChildrenIndex = 0
    var selectedChildrenNumber:String!
    
    var selectedInfantsIndex = 0
    var selectedInfantsNumber:String!
    
    //adults number array
    var adultsNumberArray:[String] = ["1","2","3","4","5","6","7"]
    
    //children number array
    var childrenNumberArray:[String] = ["0","1","2","3","4","5","6"]
    
    //infants number array
    var infantsNumberArray:[String] = ["0","1","2","3","4","5","6"]
    
    //Adults PickerView
    let adultsPickerView : UIPickerView = {
        let pick = UIPickerView()
        pick.backgroundColor = UIColor.clear
        pick.tag = 0
        return pick
    }()
    
    //Children PickerView
    let childrenPickerView : UIPickerView = {
        let pick = UIPickerView()
        pick.backgroundColor = UIColor.clear
        pick.tag = 1
        return pick }()
    
    //Infants PickerView
    let infantsPickerView : UIPickerView = {
        let pick = UIPickerView()
        pick.backgroundColor = UIColor.clear
        pick.tag = 2
        return pick }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adultsPickerView.delegate = self
        adultsPickerView.dataSource = self
        
        childrenPickerView.delegate = self
        childrenPickerView.dataSource = self
        
        infantsPickerView.delegate = self
        infantsPickerView.dataSource = self
        
        CreateAdultsPicker()
        CreateChildrenPicker()
        CreateInfantsPicker()
    }
    
    //To Create Adults PickerView
    func CreateAdultsPicker() {
        adultsPickerView.backgroundColor = UIColor.clear
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed_adults))
        toolBar.setItems([doneButton], animated: true)
        self.adultsPickerView.reloadAllComponents()
        adultsTextField.inputAccessoryView = toolBar
        adultsTextField.inputView = adultsPickerView
    }
    
    //Adults Picker Done Button
    @objc func donePressed_adults() {
        
        self.adultsTextField.endEditing(true)
        adultsTextField.text = "\(adultsNumberArray[selectedAdultsIndex])"
        
        switch (selectedAdultsIndex){
        case 0:
            selectedAdultsNumber = "1"
        case 1:
            selectedAdultsNumber = "2"
        case 2:
            selectedAdultsNumber = "3"
        case 3:
            selectedAdultsNumber = "4"
        case 4:
            selectedAdultsNumber = "5"
        case 5:
            selectedAdultsNumber = "6"
        case 6:
            selectedAdultsNumber = "7"
        default:
        selectedAdultsNumber = "0"
        }
    }
    
    //To Create Children PickerView
    func CreateChildrenPicker() {
        childrenPickerView.backgroundColor = UIColor.clear
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed_children))
        toolBar.setItems([doneButton], animated: true)
        self.childrenPickerView.reloadAllComponents()
        childrenTextField.inputAccessoryView = toolBar
        childrenTextField.inputView = childrenPickerView
    }
    
    //Adults Picker Done Button
    @objc func donePressed_children() {
        
        self.childrenTextField.endEditing(true)
        childrenTextField.text = "\(childrenNumberArray[selectedChildrenIndex])"
        
        switch (selectedChildrenIndex){
            
        case 0:
            selectedChildrenNumber = "0"
        case 1:
            selectedChildrenNumber = "1"
        case 2:
            selectedChildrenNumber = "2"
        case 3:
            selectedChildrenNumber = "3"
        case 4:
            selectedChildrenNumber = "4"
        case 5:
            selectedChildrenNumber = "5"
        case 6:
            selectedChildrenNumber = "6"
        default:
            selectedChildrenNumber = "0"
        }
    }
    
    //To Create Infants PickerView
    func CreateInfantsPicker() {
        infantsPickerView.backgroundColor = UIColor.clear
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed_infants))
        toolBar.setItems([doneButton], animated: true)
        self.infantsPickerView.reloadAllComponents()
        infantsTextField.inputAccessoryView = toolBar
        infantsTextField.inputView = infantsPickerView
    }
    
    //Adults Picker Done Button
    @objc func donePressed_infants() {
        
        self.infantsTextField.endEditing(true)
        infantsTextField.text = "\(infantsNumberArray[selectedInfantsIndex])"
        
        switch (selectedInfantsIndex){
            
        case 0:
            selectedInfantsNumber = "0"
        case 1:
            selectedInfantsNumber = "1"
        case 2:
            selectedInfantsNumber = "2"
        case 3:
            selectedInfantsNumber = "3"
        case 4:
            selectedInfantsNumber = "4"
        case 5:
            selectedInfantsNumber = "5"
        case 6:
            selectedInfantsNumber = "6"
        default:
            selectedInfantsNumber = "0"
        }
    }
    
    func showDialog(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func bookNow(){
    validateBooking()
    }
    
    func validateBooking(){
        let adultsInput:String = adultsTextField.text!
        let childrenInput:String = childrenTextField.text!
        let infantsInput:String = infantsTextField.text!
        
        var adults:Int = Int(adultsInput) ?? 0
        var children:Int = Int(childrenInput) ?? 0
        var infants:Int = Int(infantsInput) ?? 0
        
        var gotChild,gotInfants,rooms: Int
        rooms = 0
        
        if(adults + children > 7){
            showDialog(title: "Hotel Transylvania", message: "Booking is not allowed for more than 7 guests.")
        }else {
            
            while(children+infants>0){
                
                gotInfants=min(3,infants)
                gotChild=min(3,children)
                adults -= 1
                children-=gotChild
                infants-=gotInfants
                rooms += 1
                
                if(((infants>0||children>0)&&adults==0)||rooms>3){
                    showDialog(title: "Hotel Transylvania", message: "Wrong Booking.")
                    return
                }
            }
            
            if(adults>rooms*2){
                let x:Double = Double(adults)/3.0
                let y = Int(ceilf(Float(x)))
                rooms += y
            }
            
            if(rooms>3){
                showDialog(title: "Hotel Transylvania", message: "Wrong Booking")
            }
            else{
                showDialog(title: "Hotel Transylvania", message: "Number of rooms is: \(rooms)")
            }
    }
}
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
        return adultsNumberArray.count
        }else if pickerView.tag == 1{
        return childrenNumberArray.count
        }else if pickerView.tag == 2{
        return infantsNumberArray.count
        }else{
        return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
        return adultsNumberArray[row]
        }else if pickerView.tag == 1{
        return childrenNumberArray[row]
        }else if pickerView.tag == 2{
        return infantsNumberArray[row]
        }else{
        return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
        selectedAdultsIndex = row
        }else if pickerView.tag == 1{
        selectedChildrenIndex = row
        }else if pickerView.tag == 2{
            selectedInfantsIndex = row
        }
    }
}
