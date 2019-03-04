//
//  ViewController.swift
//  TableViewAndNavigation
//
//  Created by yonekan on 2019/03/04.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // プログラミング言語を保管する配列
    let languages = ["HTML", "CSS", "Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定を反映させるおまじない
        tableView.dataSource = self
        tableView.delegate = self
    }

    // テーブルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    // テーブルのセルの中身の設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identifierが「languageCell」のセルを取ってきて、変数cellに保存
        // IdentifierはMain.storyboardで設定した。
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        
        // セルのラベルをプログラミング言語の配列から取得した文字にする
        cell.textLabel?.text = "\(languages[indexPath.row])"
        
        // 左矢印の設定
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // セルがクリックされたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // フォーカス解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        let language = languages[indexPath.row]
        print(language)
        
        // 次の画面に遷移する
        // withIdentifier:矢印の名前
        // sender:次の画面に渡すもの
        performSegue(withIdentifier: "toSecond", sender: language)
    }
    
    // 次の画面に遷移される時に実行される
    // 次の画面に値を渡す時の設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            // 矢印の名前が"toSecond"の場合に実行される
            let secondVC = segue.destination as! SecondViewController
            
            // SecondViewControllerの変数languageに、テーブルビューで選択された言語を設定
            secondVC.language = sender as! String
        }
    }
}

