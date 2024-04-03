//
//  ViewController.swift
//  Assignment11
//
//  Created by Ana on 4/3/24.
//


// ვიყენებ iphone 14 Pro-ს

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        return switchControl
    }()
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.text = "უმცირესი საერთო ჯერადი"
        return label
    }()
    
    private lazy var firstValue: UITextField = {
        let firstvalue = UITextField()
        firstvalue.text = "შეიყვანეთ მნიშვნელობა"
        firstvalue.borderStyle = .roundedRect
        firstvalue.layer.cornerRadius = 10
        firstvalue.textColor = .lightGray
        return firstvalue
    }()
    
    private lazy var secondValue: UITextField = {
        let secondValue = UITextField()
        secondValue.text = "შეიყვანეთ მნიშვნელობა"
        secondValue.borderStyle = .roundedRect
        secondValue.layer.cornerRadius = 10
        secondValue.textColor = .lightGray
        return secondValue
    }()
    
    private lazy var calculationButton: UIButton = {
        let calculationButton = UIButton()
        calculationButton.setTitle("გამოთვლა", for: .normal)
        calculationButton.backgroundColor = .blue
        calculationButton.layer.cornerRadius = 15
        calculationButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return calculationButton
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "პასუხი: "
        return resultLabel
    }()
    
    private var isGCDMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(switchControl)
        view.addSubview(taskLabel)
        view.addSubview(firstValue)
        view.addSubview(secondValue)
        view.addSubview(calculationButton)
        view.addSubview(resultLabel)
        
        switchControl.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        taskLabel.snp.makeConstraints { make in
            make.centerY.equalTo(switchControl.snp.centerY)
            make.leading.equalToSuperview().offset(20)
        }
        
        firstValue.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)        }
        
        secondValue.snp.makeConstraints { make in
            make.top.equalTo(firstValue.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)        }
        
        calculationButton.snp.makeConstraints { make in
            make.top.equalTo(secondValue.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(calculationButton.snp.bottom).offset(40)
        }
                
    }

    @objc private func switchValueChanged() {
        taskLabel.text = switchControl.isOn ? "უდიდესი საერთო გამყოფი" : "უმცირესი საერთო ჯერადი"
    }
    
    @objc private func validateInput(_ input: String) -> Bool {
        return Int(input) != nil
    }

    @objc private func calculateButtonTapped() {
        firstValue.layer.borderColor = UIColor.clear.cgColor
        secondValue.layer.borderColor = UIColor.clear.cgColor
        firstValue.layer.borderWidth = 0.0
        secondValue.layer.borderWidth = 0.0
        
        if let num1String = firstValue.text, let num1 = Int(num1String) {
            if let num2String = secondValue.text, let num2 = Int(num2String) {
                var result: Int
                if switchControl.isOn {
                    result = gcd(num1, num2)
                    resultLabel.text = "პასუხი: \(result)"
                } else {
                    result = lcm(num1, num2)
                    resultLabel.text = "პასუხი: \(result)"
                }
            } else {
                secondValue.layer.borderColor = UIColor.red.cgColor
                secondValue.layer.borderWidth = 1.0
                resultLabel.text = "შეიყვანეთ რიცხვები"
            }
        } else {
            firstValue.layer.borderColor = UIColor.red.cgColor
            firstValue.layer.borderWidth = 1.0
            
            if secondValue.text?.isEmpty == false {
                secondValue.layer.borderColor = UIColor.red.cgColor
                secondValue.layer.borderWidth = 1.0
            }
            
            resultLabel.text = "შეიყვანეთ რიცხვები"
        }
    }
    
    //GCD
    private func gcd(_ a: Int, _ b: Int) -> Int {
      let r = a % b
        if r != 0 {
            return gcd(b, r)
      } else {
            return b
    }
}

    //LCM
    private func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }
}

