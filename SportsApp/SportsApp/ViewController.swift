//
//  ViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let networkService: NetworkService = NetworkService()
    var sports: [Sport] = [Sport]()
    
    @IBAction func btn(_ sender: UIButton) {
        print("hi")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         func getTodos(){
             view?.showIndicator()
             interactor.getTodos(endPoint: "todos", completionHandler: { [weak self] todos, error in
                 
                 print("Completion handler ")
                 
                 guard let self = self else { return }
                 self.view?.hideIndicator()
                 
                 if let error = error {
                     self.view?.showError()
                 } else {
                     guard let todos = todos else { return }
                     self.todos = todos
                     print("Completion handler success \(todos.count)")
                     self.view?.fetchingDataSuccess()
                 }
             })
         }
         */
        networkService.getResponse(completionHandler: { [weak self] sports, error in
            print("Completion Handler")
            guard let self = self else {return}
            if let error = error{
                print("Error")
            }else{
                guard let sports = sports else {return}
                self.sports = sports
                print("ELSEEE")
            }
        })
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
