//
//  ViewController.swift
//  Turtles
//
//  Created by 17586317 on 03.07.2020.
//  Copyright © 2020 Борисов Сергей Александрович. All rights reserved.

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let images = ["Леонардо", "Донателло", "Микеланджело", "Рафаэль"]
    let fileNames = ["Leo", "Don", "Miki", "Raf"]
    let questions = ["Пицца🍕", "Мастерить🛠", "Тренировки🤼‍♂️", "Грустить😞"]
    let answer = [2, 1, 0, 3]
    let bonus = ["turtles_icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: fileNames[0])
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        pickerView.setValue(UIColor.black, forKey: "textColor")
        if component == 0{
            return images.count
        }
        else{
            return questions.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            
            return images[row]
        }
        else {
            return questions[row]
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            imageView.image=UIImage(named: fileNames[row])
        }
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        let imageWin = UIImage(named: "turtlesAnswer")
        let imageGameOver = UIImage(named: "mikiWrongAns")
        
        
        let romComponent1 = pickerView.selectedRow(inComponent: 0)
        let rowComponent2 = pickerView.selectedRow(inComponent: 1)
        var messages: String
        if answer [romComponent1] == rowComponent2 {
            messages =  "Правильно! 👍"
            
            let alert = UIAlertController(title: "Викторина", message: messages, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "ОК", style: .cancel, handler: nil )
            
            alert.addImage(image:imageWin!)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        else {
            messages = "Неправильно! 👎"
            let alert = UIAlertController(title: "Викторина", message: messages, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "ОК", style: .cancel, handler: nil )
            
            alert.addImage(image:imageGameOver!)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        

    
    }
    
}

