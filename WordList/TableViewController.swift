//
//  TableViewController.swift
//  WordList
//
//  Created by 山下幸助 on 2023/05/11.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var wordArray: [Dictionary<String, String>] = []
    var saveData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return wordArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary = wordArray[indexPath.row]
        
        cell.englishLabel.text = nowIndexPathDictionary["english"]
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
        
        return cell
    }
}
