//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit

protocol LeagueDetailsProtocol {
    func fillTeamsData()
    func fillUpcomingData()
}

class LeaguesDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var teamsCV: UICollectionView!
    
    @IBOutlet weak var upComingCV: UICollectionView!
    var teams: [Team] = [Team]()
    var upcomingEvents: [Event] = [Event]()
    
    var presenter: LeagueDetailsPresenter!
    var selectedTeam: Team!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingCV.delegate = self
        upComingCV.dataSource = self
        teamsCV.delegate = self
        teamsCV.dataSource = self
        
        //PRESENTER
        
        presenter = LeagueDetailsPresenter(NWService: NetworkService())
        presenter.attatchView(view: self)
        presenter.getAllTeams()
        presenter.getUpcomingEvents()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == upComingCV{
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
            
        }
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == upComingCV{
            return upcomingEvents.count
            
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upComingCV {
            let event: Event = upcomingEvents[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcoming_cell", for: indexPath) as! UpcomingCell
            cell.layer.cornerRadius = 10
            let url = URL(string: event.strThumb)
            cell.imageEvent.kf.setImage(with: url)
            cell.imageEvent.layer.cornerRadius = 15
            cell.imageEvent.layer.masksToBounds = true
            cell.dateLabel.text = event.dateEvent
            cell.timeLabel.text = event.strTime
            
            return cell
        }
        let team : Team = teams[indexPath.row]
        
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teams_cell", for: indexPath) as! TeamCell
        
        let url = URL(string: team.teamBadge)
        
        teamCell.teamBadge.kf.setImage(with: url)
        return teamCell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == teamsCV{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "team_details")
                as TeamDetailsViewController
            
            vc.modalPresentationStyle = .fullScreen
            vc.selectedTeam = teams[indexPath.row]
            
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    
}
extension LeaguesDetailsViewController: LeagueDetailsProtocol{
    func fillTeamsData() {
        
        teams = presenter.allTeams
        teamsCV.reloadData()
        print(teams)
        
    }
    
    func fillUpcomingData(){
        upcomingEvents = presenter.upcomingEvents
        upComingCV.reloadData()
        //print(upcomingEvents)
        
    }
    
    
    
}
