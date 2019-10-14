//
//  TableViewController.swift
//  TestMemo
//
//  Created by 松尾大雅 on 2019/10/13.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let textArry: NSMutableArray = [
    "1番めのセル","2番めのセル","3番めのセル"]
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        // Cellの登録.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        // DataSourceの設定.
        myTableView.dataSource = self

        // Delegateを設定.
        myTableView.delegate = self

        // 罫線を青色に設定.
        myTableView.separatorColor = UIColor.blue

        // 編集中のセル選択を許可.
        myTableView.allowsSelectionDuringEditing = true

        myTableView.rowHeight = 100
       }
    
   
    
    /*
     addButtonが押された際呼び出される
     */
    @IBAction func addCell(sender: AnyObject) {
        print("追加")

        // textArryに追加.
       textArry.add("新しいセル")

        // TableViewを再読み込み.
        myTableView.reloadData()
    }
    
   
    
        //セクション数を指定
       func numberOfSections(in tableView: UITableView) -> Int {
           print("セクション数：1")
           return 1
       }
       //セクションタイトルを指定
//       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//           return "\(section)組"
//       }
    
    //セル数を指定
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return textArry.count
          }
       //セル数を指定
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           print("セル数：3")
//           return 3
//       }
       //セルを生成
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           print("セルの値を入れていく")
           let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                      reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
          cell.textLabel?.text = " 名前"
        cell.backgroundColor = UIColor.systemTeal
           cell.detailTextLabel?.text = "\(indexPath.row + 1)番"
           //cell.detailTextLabel?.numberOfLines = 0
           //cell.detailTextLabel?.text = textArry[indexPath.row]
           cell.imageView?.image = UIImage(named: "kid_seikaku_kachiki_boy.png")
           return cell
       }

    
    
    
    
    /*
        ボタンイベント
        */
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           // UIAlertControllerを作成する.
           let myAlert: UIAlertController = UIAlertController(title: "表示したい画面を選択してください", message: "", preferredStyle: .alert)

           // OKのアクションを作成する.
           let InfoAction = UIAlertAction(title: "個人情報確認画面へ", style: .default) { action in
               print("Action OK!!")
            switch indexPath.row {
            case 0:
                // 数学Iのセルタップ時処理
                self.performSegue(withIdentifier: "toInfo", sender: nil)
                
            case 1:
                // 数学Iのセルタップ時処理
                self.performSegue(withIdentifier: "toInfo", sender: nil)
            
            default:
                self.performSegue(withIdentifier: "toInfo", sender: nil)
            }
        }
        
           let DiaryAction = UIAlertAction(title: "日報記入画面へ", style: .default) { action in
                print("Action OK!!")
            switch indexPath.row {
                                   case 0:
                                       // 数学Iのセルタップ時処理
                                       // 以下はセグエで数学Iの画面遷移する場合の例
                                       self.performSegue(withIdentifier: "toDate", sender: nil)
                                   
                                   default:
                                       self.performSegue(withIdentifier: "toDate", sender: nil)
                                   }
                               }
                      
            
        let CancelAction = UIAlertAction(title: "キャンセル", style: .default) { action in
            print("Action OK!!")
        }
        
           // OKのActionを追加する.
           myAlert.addAction(InfoAction)
           myAlert.addAction(DiaryAction)
           myAlert.addAction(CancelAction)
           // UIAlertを発動する.
           present(myAlert, animated: true, completion: nil)
       }
//セルがタップされた時呼び出される
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            print ("押されました")
//            switch indexPath.row {
//            case 0:
//                // 数学Iのセルタップ時処理
//                // 以下はセグエで数学Iの画面遷移する場合の例
//                self.performSegue(withIdentifier: "toDate", sender: nil)
//            case 1:
//                // 数学Aのセルタップ時
//                 self.performSegue(withIdentifier: "toInfo", sender: nil)
//            case 2:
//                // 数学IIのセルタップ時
//                 self.performSegue(withIdentifier: "toDiary", sender: nil)
//            case 3:
//                // 数学Bのセルタップ時
//                 self.performSegue(withIdentifier: "toDate", sender: nil)
//            case 4:
//                // 数学IIIのセルタップ時
//                self.performSegue(withIdentifier: "toDate", sender: nil)
//            case 5:
//                // 数学Cのセルタップ時
//                self.performSegue(withIdentifier: "toDate", sender: nil)
//
//            default:
//                self.performSegue(withIdentifier: "toDate", sender: nil)
//            }
//        }
    
    
    
    
    
    
    
    
    
    /*
     Cellを挿入または削除しようとした際に呼び出される
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // 削除のとき.
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("削除")

            // 指定されたセルのオブジェクトをtextArryから削除する.
            textArry.removeObject(at: indexPath.row)

            // TableViewを再読み込み.
            myTableView.reloadData()
        }
    }


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



