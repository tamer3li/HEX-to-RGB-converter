//
//  ViewController.swift
//  HEX to RGB converter
//
//  Created by tamerali on 29/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redValueField: UITextField!
    @IBOutlet weak var greenValueField: UITextField!
    @IBOutlet weak var blueValueField: UITextField!
    @IBOutlet weak var alphaValueField: UITextField!
    @IBOutlet weak var convertField: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    enum convertionType {
    case hexToRgb
    case RgbToHex
    }
    var convertion : convertionType = .hexToRgb
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            convertion = .hexToRgb
            convertField.setTitle("convertHEXToRGB", for: .normal)
        case 1:
            convertion = .RgbToHex
            convertField.setTitle("convertRGBToHEX", for: .normal)
        default:
            convertion = .hexToRgb
            convertField.setTitle("convertHEXToRGB", for: .normal)
        }
        
        print(convertion)
        redValueField.text?.removeAll()
        blueValueField.text?.removeAll()
        greenValueField.text?.removeAll()
        alphaValueField.text?.removeAll()
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
            
        switch convertion {
        case .hexToRgb:
            self.view.backgroundColor = convertHexToRgb()
        case .RgbToHex:
            self.view.backgroundColor = convertRgbToHex()
        }
        
    }
    
    func convertHexToRgb()-> UIColor? {
       guard let redText = UInt8(redValueField.text!,radix: 16) else { return nil }
       guard let greenText = UInt8(greenValueField.text!,radix: 16)  else { return nil }
       guard let blueText = UInt8(blueValueField.text!,radix: 16)  else { return nil }
       guard let alphaText = Float(alphaValueField.text!)  else { return nil }
       if alphaText > 1 || alphaText < 0 {
           return nil
       }
       
       displayLabel.text = "red:\(redText) \ngreen:\(greenText)\nblue:\(blueText)\nalpha:\(alphaText)"
        let backGroundColor :UIColor = UIColor(displayP3Red: CGFloat(Float(redText)) / 255, green: CGFloat(Float(greenText)) / 255, blue: CGFloat(Float(blueText)) / 255, alpha:CGFloat(alphaText))
   
        return backGroundColor
    }
    
   func convertRgbToHex() -> UIColor? {
       
       guard let redText = UInt8(redValueField.text!) else { return nil }
       guard let greenText = UInt8(greenValueField.text!)  else { return nil }
       guard let blueText = UInt8(blueValueField.text!)  else { return nil }
       guard let alphaText = Float(alphaValueField.text!)  else { return nil }
       if alphaText > 1 || alphaText < 0 {
           return nil
       }
       let redString : String = String(format: "%2X",redText)
       let greenString : String = String(format: "%2X",greenText)
       let blueString : String = String(format: "%2X",blueText)
       
       displayLabel.text = "HEX code #\(redString)\(greenString)\(blueString)\nalpha:\(alphaText)"
        let backGroundColor :UIColor = UIColor(displayP3Red: CGFloat(Float(redText)) / 255, green: CGFloat(Float(greenText)) / 255, blue: CGFloat(Float(blueText)) / 255, alpha:CGFloat(alphaText))
   
        return backGroundColor
            }


}

