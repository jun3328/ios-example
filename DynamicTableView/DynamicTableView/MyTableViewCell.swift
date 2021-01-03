//
//  MyTableViewCell.swift
//  DynamicTableView
//
//  Created by lee on 2021/01/25.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userContent: UILabel!
    
    // 셀이 렌더링 될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("MyTableViewCell - awakeFromNib() called")
        
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
