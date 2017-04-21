//
//  EventListCell.swift
//  PatrickMaster
//
//  Created by indianic on 21/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class EventListCell: UITableViewCell {

    
    @IBOutlet weak var imgViewEvents: UIImageView!
    
    @IBOutlet weak var lblEventName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
