//
//  AllLeaguesTableViewCell.swift
//  SportsApp
//
//  Created by Hala Emad on 5/15/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit

class AllLeaguesTableViewCell: UITableViewCell {
    @IBOutlet weak var leagueImg: UIImageView!
    
    @IBOutlet weak var youtubeBtn: UIButton!
    @IBOutlet weak var leagueNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
