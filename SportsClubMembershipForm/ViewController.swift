//
//  ViewController.swift
//  SportsClubMembershipForm
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var lastnameLabel: UITextField!
    
    
    @IBOutlet weak var firstnameLabel: UITextField!
    
    
    @IBOutlet weak var emailLabel: UITextField!
    
    
    @IBOutlet weak var phonenumberLabel: UITextField!
    
    
    @IBOutlet weak var addressLine1: UITextField!
    
    
    @IBOutlet weak var addressLine2: UITextField!
    
    
    @IBOutlet weak var cityLabel: UITextField!
    
    
    @IBOutlet weak var regionLabel: UITextField!
    
    
    @IBOutlet weak var zipCodeLabel: UITextField!

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var coutryTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var successMessageLabel: UILabel!
    
    @IBOutlet weak var emptyMessageLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    //var countryFormatter = countryFormatter()
    //var pickerFormatter = pickerFormatter
    
    //let pickerView = UIPickerView()
    
    var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        
        firstnameLabel.delegate = self
        lastnameLabel.delegate = self
        emailLabel.delegate = self
        phonenumberLabel.delegate = self
        addressLine1.delegate = self
        addressLine2.delegate = self
        cityLabel.delegate = self
        regionLabel.delegate = self
        zipCodeLabel.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        firstnameLabel.becomeFirstResponder()
        
        coutryTextField.inputView = pickerView
        coutryTextField.textAlignment = .center
        
        
        let localesList = NSLocale.isoCountryCodes
        
        for localeListItem in localesList
        {
            let localeIndentifier = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: localeListItem])
            
            let locale = NSLocale(localeIdentifier: localeIndentifier)
            
            let countryName = locale.displayName(forKey: NSLocale.Key.identifier, value: localeIndentifier)!
            countries.append(countryName)
        }
        
        pickerView.reloadAllComponents()
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var countryPickerViewChanged: UIPickerView!
    

    @IBAction func loginTapped(_ sender: Any) {
        
        
        let firstname = firstnameLabel.text
        let lastname = lastnameLabel.text
        let email = emailLabel.text
        let phonenumber = phonenumberLabel.text
        let address1 = addressLine1.text
        let address2 = addressLine2.text
        let city = cityLabel.text
        let region = regionLabel.text
        let zipcode = zipCodeLabel.text
        
        
//
//        firstnameLabel.isEmpty || lastnameLabel.isEmpty || emailLabel.isEmpty || phonenumberLabel.isEmpty || addressLine1.isEmpty || addressLine2.isEmpty || cityLabel.isEmpty || regionLabel.isEmpty || cityLabel.isEmpty || zipCodeLabel.isEmpty
        
        if(firstnameLabel.text!.isEmpty || lastnameLabel.text!.isEmpty || emailLabel.text!.isEmpty || phonenumberLabel.text!.isEmpty || addressLine1.text!.isEmpty || addressLine2.text!.isEmpty || cityLabel.text!.isEmpty || regionLabel.text!.isEmpty || cityLabel.text!.isEmpty ||
                       zipCodeLabel.text!.isEmpty)
        
        {
            var myAlert = UIAlertController(title: "Alert", message: "Please complete all of the required fields!", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
            
        }
        
        
        
        
           //            zipCodeLabel.text!.isEmpty)
        
//        if firstnameLabel.text!.isEmpty || lastnameLabel.text!.isEmpty || emailLabel.text!.isEmpty || phonenumberLabel.text!.isEmpty || addressLine1.text!.isEmpty || addressLine2.text!.isEmpty || cityLabel.text!.isEmpty || regionLabel.text!.isEmpty || cityLabel.text!.isEmpty ||
//            zipCodeLabel.text!.isEmpty {
//
//            //return emptyMessageLabel
//            print(" ", emptyMessageLabel!)
//        }
//        else {
//
//             print(" ", successMessageLabel!)
//
//        }
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if
//    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coutryTextField.text = countries[row]
        coutryTextField.resignFirstResponder()
    }
    
    
    
}
