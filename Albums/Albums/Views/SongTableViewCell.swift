//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Niranjan Kumar on 12/2/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var duration: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func addSong(_ sender: Any) {
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
