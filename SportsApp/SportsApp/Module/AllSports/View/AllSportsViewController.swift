//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import Kingfisher

protocol AllSportsProtocol : AnyObject{
    func stopAnimating()
    func updateUI(sports: [Sport])
}

class AllSportsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var sportsArray = [Sport]()
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllSportsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        presenter = AllSportsPresenter(NWService: NetworkService())
        presenter.attachView(view: self)
        
        if Connectivity.isNetworkReachable(){
            presenter.getItems()

        }
        else{
            showAlert(title: "Connection Alert", message: "There is no connection. Please check your connection and try again")
        }
    }
    
  
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCustomCollectionViewCell
        
        // Configure the cell
        let sport = sportsArray[indexPath.row]
        cell.sportName.text = sport.sportName
        let url = URL(string: sport.sportThumb)
        cell.sportImage.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let allLeagues = main.instantiateViewController(identifier: "AllLeaguesVC") as AllLeaguesViewController
        allLeagues.modalPresentationStyle = .fullScreen
        allLeagues.leagueName = sportsArray[indexPath.row].sportName
        navigationController?.pushViewController(allLeagues, animated: true)
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     let cellWidth = UIScreen.main.bounds.width / 2.0
     let cellHight = UIScreen.main.bounds.height / 5.0
        return CGSize(width: cellWidth, height: cellHight)
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
   
}

extension AllSportsViewController : AllSportsProtocol {
    func stopAnimating() {
        indicator.stopAnimating()
    }
    func updateUI(sports: [Sport]){
        sportsArray = sports
        self.collectionView.reloadData()
    }
}
