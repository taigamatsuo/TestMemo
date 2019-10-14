//
//  AddMemoViewController.swift
//  TestMemo
//
//  Created by 松尾大雅 on 2019/10/13.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController  {

    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var dateTextField : UITextField!
    @IBOutlet var taityouTextField : UITextField!
    @IBOutlet var gohannTextField : UITextField!
    @IBOutlet var suiminnTextField : UITextField!
    @IBOutlet var memoTextView: UITextView!
    
    var saveData : UserDefaults = UserDefaults.standard
    var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ピッカー設定
               datePicker.datePickerMode = UIDatePicker.Mode.date
               datePicker.timeZone = NSTimeZone.local
               datePicker.locale = Locale.current
               dateTextField.inputView = datePicker

               // 決定バーの生成
               let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
               let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
               let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
               toolbar.setItems([spacelItem, doneItem], animated: true)

               // インプットビュー設定(紐づいているUITextfieldへ代入)
               dateTextField.inputView = datePicker
               dateTextField.inputAccessoryView = toolbar
           }
    // UIDatePickerのDoneを押したら発火
    @objc func done() {
        dateTextField.endEditing(true)

        // 日付のフォーマット
        let formatter = DateFormatter()

        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy年MM月dd日"

        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        dateTextField.text = "\(formatter.string(from: datePicker.date))"
    }
    //userdefaultsから読み込む
//        nameTextField.text = saveData.object(forKey: "name") as? String
//        dateTextField.text = saveData.object(forKey: "date") as? String
//        taityouTextField.text = saveData.object(forKey: "taityou") as? String
//        gohannTextField.text = saveData.object(forKey: "gohann") as? String
//        suiminnTextField.text = saveData.object(forKey: "suiminn") as? String
//        memoTextView.text = saveData.object(forKey: "memo") as? String
    

    
    //saveボタンが押された時
//    @IBAction func saveMemo(){
//        //userdefaultsに書き込み
//        saveData.set(nameTextField.text , forKey: "name")
//        saveData.set(dateTextField.text , forKey: "date")
//        saveData.set(taityouTextField.text , forKey: "taityou")
//        saveData.set(gohannTextField.text , forKey: "gohann")
//        saveData.set(suiminnTextField.text , forKey: "suiminn")
//        saveData.set(memoTextView.text , forKey: "memo")
//
//        showAlert(title: "保存完了")
//
//    }
//
    
    @IBAction func save(_ sender: Any) {

        let inputText = memoTextView.text
//        let inputText2 = nameTextField.text
        let inputText3 = dateTextField.text
//        let inputText4 = taityouTextField.text
//        let inputText5 = gohannTextField.text
//        let inputText6 = suiminnTextField.text

        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            //saveMemoArrayに取得
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            


                //テキストに何か書かれているか？
            if inputText != ""{
                //配列に追加(Dateに表示される)
                //saveMemoArray.append(inputText!)
                saveMemoArray.append(inputText3!)
                ud.set(saveMemoArray, forKey: "memoArray")
            
            }else{
                showAlert(title: "何も入力されていません")

            }

        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String]()
            //nilを強制アンラップはエラーが出るから
            if inputText != ""{
                //inputtextはoptional型だから強制アンラップ

                newMemoArray.append(inputText!)
                ud.set(newMemoArray, forKey: "memoArray")
            }else{
                showAlert(title: "何も入力されていません")
            }
        }
        showAlert(title: "保存完了")
        ud.synchronize()
    }

    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion:nil)
    }

}
