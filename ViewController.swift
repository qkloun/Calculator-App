//
//  ViewController.swift
//  Calculator Attempt 1
//
//  Created by Yunus Karatas on 6/22/24.
//

import UIKit

class ViewController: UIViewController 
{
    @IBOutlet weak var Calculatorworkings: UILabel!
    
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClearAll()
    }

    func ClearAll(){
        workings = ""
        Calculatorworkings.text = ""
        CalculatorResults.text = ""
        
    }
    
    func AddtoWorkings(value: String){
        workings = workings + value
        Calculatorworkings.text = workings
        
    }
    
    @IBAction func AllClearTap(_ sender: Any) {
        ClearAll()
    }
    
    @IBAction func PercentTap(_ sender: Any) {
        AddtoWorkings(value:"%")
    }
    
    @IBAction func DivisionTap(_ sender: Any) {
        AddtoWorkings(value:"/")
    }
    
    @IBAction func MultiplicationTap(_ sender: Any) {
        AddtoWorkings(value:"*")
    }
    
    @IBAction func SubtractionTap(_ sender: Any) {
        AddtoWorkings(value:"-")
    }
    
    @IBAction func AdditionTap(_ sender: Any) {
        AddtoWorkings(value:"+")
    }
    
    @IBAction func EqualsTap(_ sender: Any) {
        if(ValidInput()){
            let CheckedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let Expression = NSExpression (format: CheckedWorkingsForPercent)
            let result = Expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = FormatResult(result: result)
            CalculatorResults.text = resultString
        }
        else{
            let Alert = UIAlertController(title: "Invalid Input", message: "Calculator can't compute", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(Alert, animated: true, completion: nil)
        }
    }
    
    func ValidInput() -> Bool{
        var count = 0
        var FuncCharIndexes = [Int]()
        
        for char in workings{
            if(SpecialCharacter(char: char)){
                FuncCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in FuncCharIndexes{
            if(index == 0){
                return false
            }
            
            if(index == workings.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
        }
    
    func SpecialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func FormatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func DeleteTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            Calculatorworkings.text = workings
        }
    }
    
    @IBAction func DotTap(_ sender: Any) {
        AddtoWorkings(value:".")
    }
    
    @IBAction func ZeroTap(_ sender: Any) {
        AddtoWorkings(value:"0")
    }
    
    @IBAction func OneTap(_ sender: Any) {
        AddtoWorkings(value:"1")
    }
    
    @IBAction func TwoTap(_ sender: Any) {
        AddtoWorkings(value:"2")
    }
    
    @IBAction func ThreeTap(_ sender: Any) {
        AddtoWorkings(value:"3")
    }
    
    @IBAction func FourTap(_ sender: Any) {
        AddtoWorkings(value:"4")
    }
    
    @IBAction func FiveTap(_ sender: Any) {
        AddtoWorkings(value:"5")
    }
    
    @IBAction func SixTap(_ sender: Any) {
        AddtoWorkings(value:"6")
    }
    
    @IBAction func SevenTap(_ sender: Any) {
        AddtoWorkings(value:"7")
    }
    
    @IBAction func EightTap(_ sender: Any) {
        AddtoWorkings(value:"8")
    }
    
    @IBAction func NineTap(_ sender: Any) {
        AddtoWorkings(value:"9")
    }
}
