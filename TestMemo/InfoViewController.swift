//
//  InfoViewController.swift
//  TestMemo
//
//  Created by 松尾大雅 on 2019/10/13.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
      @IBOutlet var areruTextField : UITextField!
      @IBOutlet var telTextField : UITextField!
      @IBOutlet var mailTextField : UITextField!
    
    var saveData : UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        areruTextField.text = saveData.object(forKey: "areru") as? String
        telTextField.text = saveData.object(forKey: "tel") as? String
        mailTextField.text = saveData.object(forKey: "mail") as? String
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        saveData.set(areruTextField.text , forKey: "areru")
        saveData.set(telTextField.text , forKey: "tel")
        saveData.set(mailTextField.text , forKey: "mail")
        showAlert(title: "保存完了")
    }
    
    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
