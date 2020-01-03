//
//  ViewController.swift
//  select
//
//  Created by 潘政杰 on 2020/1/3.
//  Copyright © 2020 潘政杰. All rights reserved.
//

import UIKit
class questionStruct {
    var question:String
    var choose:[String]
    var answer:Int
    var selected:Bool
    init (question:String, choose:[String], answer:Int, selected:Bool) {
        self.question = question
        self.choose = choose
        self.answer = answer
        self.selected = selected
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    var index = 1
    var point = 0
    var timer = Timer()
    var timerCount = 10
    var questionArray:[questionStruct]=[]
    var randomQusestionArray:[questionStruct]=[]
    
    func SetQuestion(){
        
        questionArray.append(questionStruct(question:"寶可夢鑽石珍珠的冠軍是誰?",
                                            choose: ["大吾","竹蘭","阿戴克","丹帝"],answer: 2, selected: false))
        
        questionArray.append(questionStruct(question:"下列寶可夢何者不是龍系?",
                                            choose: ["爆焰龜獸","老翁龍","噴火龍","沙漠蜻蜓"],answer: 3, selected: false))
        
        questionArray.append(questionStruct(question:"下列寶可夢何者是龍＋幽靈系?",
                                            choose: ["騎拉帝那","阿爾宙斯","達克萊伊","拉帝亞斯"],answer: 1, selected: false))
        
        questionArray.append(questionStruct(question:"下列何者不是四天王?",
                                            choose: ["菊子","源治","志米","艾莉絲"],answer: 4, selected: false))
        
        questionArray.append(questionStruct(question:"寶可夢綠寶石的冠軍是誰?",
                                            choose: ["大吾","米可利","阿戴克","丹帝"],answer: 2, selected: false))
        
        questionArray.append(questionStruct(question:"下列寶可夢何者不是幽靈系?",
                                            choose: ["迷你Q","耿鬼","達克萊伊","狙射樹梟"],answer: 3, selected: false))
        
        questionArray.append(questionStruct(question:"要挑戰四天王，需要幾個道館徽章?",
                                            choose: ["6","7","8","9"],answer: 3, selected: false))
        
        questionArray.append(questionStruct(question:"下列何者不是草系道館館主?",
                                            choose: ["阿筆","莉佳","菜種","亞洛"],answer: 1, selected: false))
        
        questionArray.append(questionStruct(question:"下列何者寶可夢不能學習火焰拳?",
                                            choose: ["鴨嘴火獸","火焰雞","黑夜魔人","爆音怪"],answer: 4, selected: false))
        
        questionArray.append(questionStruct(question:"下列何者寶可夢色違是粉紅色?",
                                            choose: ["尼多后","扭拉","信使鳥","尼多王"],answer: 2, selected: false))
        
    }
    
    func ramdomNumber()
    {
        while randomQusestionArray.count < 10 {
            
            let number = Int.random(in: 0..<questionArray.count)
            if !questionArray[number].selected {
                randomQusestionArray.append(questionArray[number])
                questionArray[number].selected=true
            }
        }
//        print(randomQusestionArray)
    }
    
    func getQuestion()
    {
        questionNumber.text = "Q"+String(index)
        
        question.text = randomQusestionArray[index - 1].question
        
        A.setTitle(randomQusestionArray[index - 1].choose[0], for: UIControl.State.normal)
        
        B.setTitle(randomQusestionArray[index - 1].choose[1], for: UIControl.State.normal)
        
        C.setTitle(randomQusestionArray[index - 1].choose[2], for: UIControl.State.normal)
        
        D.setTitle(randomQusestionArray[index - 1].choose[3], for: UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetQuestion()
        ramdomNumber()
        getQuestion()
    }
        
    @IBAction func button(_ sender: UIButton) {
        
        if((sender==A&&randomQusestionArray[index - 1].answer==1) || (sender==B&&randomQusestionArray[index - 1].answer==2) || (sender==C&&randomQusestionArray[index - 1].answer==3) || (sender==D&&randomQusestionArray[index - 1].answer==4)){
            point += 10
            score.text = String(point)
        }
        
        timerCount = 10;
        index = index + 1
        if(index <= 10){
            getQuestion()
        }else{
            A.isEnabled = false
            B.isEnabled = false
            C.isEnabled = false
            D.isEnabled = false
            restartButton.isEnabled = true
            restartButton.isHidden = false
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        for i in (0...questionArray.count - 1){
            questionArray[i].selected = false
        }
        randomQusestionArray.removeAll()
        ramdomNumber()
        index = 1
        getQuestion()
        point = 0
        score.text = String(point)
        A.isEnabled = true
        B.isEnabled = true
        C.isEnabled = true
        D.isEnabled = true
        restartButton.isEnabled = false
        restartButton.isHidden = true
    }
}

