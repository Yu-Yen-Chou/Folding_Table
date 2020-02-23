//
//  SectionView.swift
//  Folding_Table
//
//  Created by Yen on 2020/2/23.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit

protocol SectionViewDelegate: class {
    func sectionView(_ sectionView: SectionView, _ didPressTag: Int, _ isExpand: Bool)
}

class SectionView: UITableViewHeaderFooterView {

    weak var delegate: SectionViewDelegate?
    var buttonTag: Int!
    var isExpand: Bool! // cell 的狀態(展開/縮合)
    
    @IBOutlet weak var arrow_img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bg_view: UIView!
    
//    override func awakeFromNib() {
//           super.awakeFromNib()
//           // Initialization code
//          bg_view.layer.cornerRadius = 10
//       }

    
    
    @IBAction func pressExpendButton(_ sender: Any)
    {
        self.delegate?.sectionView(self, self.buttonTag, self.isExpand)
    }
   

}
