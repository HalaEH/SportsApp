//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import Kingfisher

protocol TeamDetailsProtcol {
    func setUpUI()
}

class TeamDetailsViewController: UIViewController {
    

    @IBOutlet weak var iconYoutube: UIImageView!
    @IBOutlet weak var iconInstagram: UIImageView!
    @IBOutlet weak var iconTwitter: UIImageView!
    @IBOutlet weak var iconFacebook: UIImageView!
    @IBOutlet weak var imageKit: UIImageView!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var imageBadge: UIImageView!
    @IBOutlet weak var imageStadium: UIImageView!
    var teams: [Team] = [Team]()
    var presenter: TeamDetailsPresenter!
    var selectedTeam: Team!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = TeamDetailsPresenter(NWService: NetworkService())
        presenter.attatchView(view: self)
        presenter.getAllTeams()
    }
    



}

extension TeamDetailsViewController: TeamDetailsProtcol{

    func setUpUI(){
        teams = presenter.allTeams
        //print("TeamDetails View\(self.teams)")
        teams = teams.filter { $0.idTeam == "133604" }
        selectedTeam = teams[0]
        
        teamName.text = selectedTeam.teamName
        stadiumName.text = selectedTeam.stadiumName
        setStadiumImage()
        
        setBadgeImage()
        
        setKitImage()
        
        setGestures()
        
    }
    
    func setStadiumImage(){

        let url = URL(string: selectedTeam.stadiumImage)
        self.imageStadium.kf.setImage(with: url)
        
    }
    
    func setBadgeImage(){
        
        let url = URL(string: selectedTeam.teamBadge)
        self.imageBadge.kf.setImage(with: url)


    }
    func setKitImage(){
        let url = URL(string: selectedTeam.kitImage)
        self.imageKit.kf.setImage(with: url)

        
    }
    
    func setGestures(){
        let facebookTap = UITapGestureRecognizer(target: self, action: #selector(iconFacebookTapped))
        let twitterTap = UITapGestureRecognizer(target: self, action: #selector(iconTwitterTapped))
        let instgramTap = UITapGestureRecognizer(target: self, action: #selector(iconInstagramTapped))
        let youtubeTap = UITapGestureRecognizer(target: self, action: #selector(iconYoutubeTapped))
        
        iconFacebook.addGestureRecognizer(facebookTap)
        iconFacebook.isUserInteractionEnabled = true
        
        iconTwitter.addGestureRecognizer(twitterTap)
        iconTwitter.isUserInteractionEnabled = true
        
        iconInstagram.addGestureRecognizer(instgramTap)
        iconInstagram.isUserInteractionEnabled = true
        
        iconYoutube.addGestureRecognizer(youtubeTap)
        iconYoutube.isUserInteractionEnabled = true
        
        
    }
    
    @objc func iconFacebookTapped(gesture: UIGestureRecognizer){
        if (gesture.view as! UIImageView != nil){
            gotoUrl(url: selectedTeam.facebook)
        
        }
    }
    
    @objc func iconTwitterTapped(gesture: UIGestureRecognizer){
        if (gesture.view as! UIImageView != nil){
            gotoUrl(url: selectedTeam.twitter)
        
        }
    }
    @objc func iconInstagramTapped(gesture: UIGestureRecognizer){
        if (gesture.view as! UIImageView != nil){
            gotoUrl(url: selectedTeam.instagram)
        
        }
    }
    @objc func iconYoutubeTapped(gesture: UIGestureRecognizer){
        if (gesture.view as! UIImageView != nil){
            gotoUrl(url: selectedTeam.youtube)
        
        }
    }
    
    func gotoUrl(url:String){
        let application = UIApplication.shared
        if application.canOpenURL(URL(string: url)!) {
            application.open(URL(string: url)!)
        }else {
            application.open(URL(string: "https://\(url)")!)
        }
    }


}
