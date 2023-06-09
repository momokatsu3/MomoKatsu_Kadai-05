//
//  ViewController.swift
//  MomoKatsu_Kadai-05
//
//  Created by モモカツ on 2023/04/23.
//  Part5 割り算アプリ（アラート表示あり）を作る

import UIKit

class ViewController: UIViewController {

    // 【Swift】Horizontal Stack Viewの使い方。部品を横一直線に並べるための入れ物。(Swift 2.1、XCode 7.2)
    // https://hajihaji-lemon.com/swift/horizontal-stack-view/
    // テキストフィールドを設定
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    // 計算結果表示用のラベルを設定
    @IBOutlet weak var calculationResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テキストフィールドを初期化
        textField1.text = ""
        textField2.text = ""
        // 各textFieldでクリックした際にキーボードタイプを数字のみに変更する
        textField1.keyboardType = UIKeyboardType.numberPad
        textField2.keyboardType = UIKeyboardType.numberPad
    }

    // 計算開始ボタンのクリックにより、ラベルに計算結果を表示する。
    @IBAction func calculationStart(_ sender: Any) {
        
        // 本関数で使用する変数の設定と初期化
        var totalData: Double = 0.0

        // テキストフィールドへ文字入力した場合、"０"とする。
        let hensuData_1 = Double(textField1.text ?? "") ?? 0
        let hensuData_2 = Double(textField2.text ?? "") ?? 0

        print("\n割られる数：'", textField1.text!, "'  割る数：'", textField2.text!, "'")
        print("割られる数：", hensuData_1, "割る数：", hensuData_2)

        // textField1が未入力の場合、アラートを発生
        if textField1.text! == "" {
            disp_Alert ( mainTitle: "課題５", subTitle: "割られる数を入力して下さい" )
            calculationResultLabel.text = "計算結果："
        }
        if textField1.text! != "0" && hensuData_1 == 0 {
            disp_Alert ( mainTitle: "課題５", subTitle: "割られる側に数字を入力して下さい" )
        }
        
        // textField2が未入力の場合、アラートを発生
        if textField2.text! == "" {
            disp_Alert ( mainTitle: "課題５", subTitle: "割る数を入力して下さい" )
            calculationResultLabel.text = "計算結果："
        }
        else {
            // textField2が"０"の場合、アラートを発生
            if hensuData_2 == 0 {
                if textField2.text! == "0" {
                    disp_Alert ( mainTitle: "課題５", subTitle: "割る数には０を入力しないで下さい" )
                    calculationResultLabel.text = "計算結果："
                }
                if textField2.text! != "0" && hensuData_2 == 0 {
                    disp_Alert ( mainTitle: "課題５", subTitle: "割る側に数字を入力して下さい" )
                }
            }
            else {
                // 計算結果を表示
                totalData = hensuData_1 / hensuData_2
                calculationResultLabel.text = "計算結果：" + String( totalData )
            }
        }
    }

    // 「タイトル」と「サブタイトル」の引数によりアラートダイアログを表示する
    func disp_Alert ( mainTitle: String, subTitle: String ) {
        // swift5でダイアログを表示する方法
        // https://qiita.com/kaneko77/items/010c3836a1a063ad015e
        //アラートのタイトル
        let dialog = UIAlertController(title: mainTitle, message: subTitle, preferredStyle: .alert)
        //ボタンのタイトル
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //実際に表示させる
        self.present(dialog, animated: true, completion: nil)
    }

}

