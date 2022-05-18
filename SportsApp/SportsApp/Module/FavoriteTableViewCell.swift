//
//  FavoriteTableViewCell.swift
//  
//
//  Created by Hala Emad on 5/18/22.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favLeagueNameLbl: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var favImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favImg.layer.cornerRadius = 75
        favImg.clipsToBounds = true
        favImg.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
