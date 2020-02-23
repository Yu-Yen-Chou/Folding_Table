//
//  ViewController.swift
//  Folding_Table
//
//  Created by Yen on 2020/2/23.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sectionDataList: [String] = ["甲類", "乙類", "丙類"]
    let cellDataList: [[String]] = [["甲-A", "甲-B", "甲-C"], ["乙-A", "乙-B", "乙-C", "乙-D", "乙-E"], ["丙-A", "丙-B", "丙-C", "丙-D", "丙-E", "丙-F", "丙-G"]]
    var isExpendDataList: [Bool] = [false, false, false]
    
    @IBOutlet weak var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.delegate = self
        tab.dataSource = self
        
        let sectionViewNib: UINib = UINib(nibName: "SectionView", bundle: nil)
        self.tab.register(sectionViewNib, forHeaderFooterViewReuseIdentifier: "SectionView")
        
        
         let cellViewNib = UINib(nibName: "Contain_Cell", bundle: nil)
         tab.register(cellViewNib, forCellReuseIdentifier: "Contain_Cell")
    }


}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.isExpendDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if self.isExpendDataList[section] {
            return self.cellDataList[section].count
        } else {
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       if self.isExpendDataList[indexPath.section] == false { return UITableViewCell() }
       if let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: Contain_Cell.self), for: indexPath) as? Contain_Cell
       {
        
            cell.title.text = self.cellDataList[indexPath.section][indexPath.row]
            return cell
        }
        return UITableViewCell()
    
    }
    
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.isExpendDataList[indexPath.section] == false { return 0 }
        else
        {
            return 80
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
       let sectionView: SectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier:String(describing: SectionView.self)) as! SectionView
        

        sectionView.isExpand = self.isExpendDataList[section]
        sectionView.buttonTag = section
        sectionView.delegate = self

        if(self.isExpendDataList[section] == true){
            sectionView.arrow_img.image = UIImage(named: "up")
        }
        else{
             sectionView.arrow_img.image = UIImage(named: "down")
        }
        // 名字
        sectionView.title.text = self.sectionDataList[section]
        
        return sectionView
     
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}

// MARK: - SectionViewDelegate
extension ViewController: SectionViewDelegate {
    func sectionView(_ sectionView: SectionView, _ didPressTag: Int, _ isExpand: Bool) {
        
        self.isExpendDataList[didPressTag] = !isExpand
        self.tab.reloadSections(IndexSet(integer: didPressTag), with: .automatic)
    }
    
}
