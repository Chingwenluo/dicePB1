//
//  ViewController.swift
//  dicePB1
//
//  Created by eric on 2020/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var stakes = 1000//宣告賭金

    @IBOutlet var diceImage: [UIImageView]!
    @IBOutlet weak var resoult: UILabel!
    @IBOutlet weak var stakeTextField: UITextField!
    @IBOutlet weak var stakesLabel: UILabel!
    @IBOutlet weak var bigSwitch: UISwitch!
    @IBOutlet weak var smallSwitch: UISwitch!
    @IBOutlet weak var loseImage: UIImageView!
    @IBOutlet weak var earnImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func randomBtn(_ sender: Any) {
        
       var sum = 0
        
        //將賭金的輸入從字串變數字
        let  money = Int(stakeTextField.text!)
   
        //亂數骰子
        for i in 0...2 {
            let number = Int.random(in: 1...6)
            diceImage[i].image = UIImage(named: "dice\(number)")
              sum = sum + number
              resoult.text = "\(sum)"
            
        }

        //判斷輸贏並計算賭金
        if sum <= 9 && smallSwitch.isOn {
            stakes = stakes + money!
            stakesLabel.text = "\(stakes)"
        }else if sum >= 10 && bigSwitch.isOn {
            stakes = stakes + money!
            stakesLabel.text = "\(stakes)"
        }else {
            stakes = stakes - money!
            stakesLabel.text = "\(stakes)"

        }
        
        if stakes < 0 {
            loseImage.isHidden = false
            earnImage.isHidden = true
        }
        
        if stakes >= 1500 {
            earnImage.isHidden = false
            loseImage.isHidden = true
        }
        
    }
        
}
    


