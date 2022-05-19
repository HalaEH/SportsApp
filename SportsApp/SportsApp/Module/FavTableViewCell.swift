//
//  FavTableViewCell.swift
//  SportsApp
//
//  Created by Hala Emad on 5/19/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favLeagueImg: UIImageView!
    
    @IBOutlet weak var favLeagueNameLbl: UILabel!
    @IBOutlet weak var favYoutubeBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favLeagueImg.layer.cornerRadius = 75
        favLeagueImg.clipsToBounds = true
        favLeagueImg.layer.borderWidth = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
