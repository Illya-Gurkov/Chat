//
//  CheckField.swift
//  Chat
//
//  Created by Illya Gurkov on 31.10.22.
//


import UIKit

class CheckField {
    static let shared = CheckField()
    init() { }
    
    //isValid
    private func isVAlid(_ type: String, _ date: String) -> Bool {
        var dataRegEx = ""
        switch type {
        case "e":
            dataRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        default :
            dataRegEx = "(?=.*[A-Z0-9a-z]).{6,}"
        }
        let dataPred = NSPredicate(format: "SELF MATCHES %@", dataRegEx)
        return dataPred.evaluate(with: date)
    }
    // validField
    func validField(_ parentView: UIView, _ field: UITextField) -> Bool {
        let id = field.restorationIdentifier
        
        switch id {
        case "name":
            if field.text?.count ?? 0 < 3 {
                validView(parentView, field, false)
                return false
            } else {
                validView (parentView, field, true)
                return true
            }
        case "email":
            if isVAlid("e", field.text!){
                validView(parentView, field, true)
                return true
            } else {
                validView(parentView, field, false)
                return false
            }
        case "password" :
            if isVAlid("p", field.text!) {
                validView(parentView, field, true)
                return true
            } else {
                validView(parentView, field, false)
                return false
            }
        default:
            if field.text?.count ?? 0 < 2{
                validView(parentView, field, false)
                return false
            } else {
                validView(parentView, field, true)
                return true
            }
        
        }
    }
    
    // valid view
    private func validView(_ parentView: UIView, _ field: UITextField, _ valid: Bool){
        if valid {
            field.backgroundColor = .white
            parentView.backgroundColor = .white
        } else {
            field.backgroundColor = .red
            parentView.backgroundColor = .red
        }
    }
    
}
