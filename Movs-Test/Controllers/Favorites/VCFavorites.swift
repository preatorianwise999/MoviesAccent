//
//  VCFavorites.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 04-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class VCFavorites: UIViewController,UITableViewDataSource ,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var favoritos = [Result]()
    //var favoritos = [MovFavorites]()
   //private var favoritos: Array<String> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         GoLoadCoreData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
        
        cell.textTitle.text = "1"  //favoritos[indexPath.row].title
        cell.textDescp.text =  "2" // favoritos[indexPath.row].overview
        cell.textDate.text =  "3"  //favoritos[indexPath.row].release_date
        
        return cell
    }
    
    @IBAction func BtnRemover(_ sender: Any) {
        
    }
    func GoLoadCoreData()
    {
       // var favoritos = [MovFavorites]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexts = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovFavorites")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try contexts.fetch(request)
            for data in result as! [NSManagedObject] {
                // print(data.value(forKey: "id"))
                // print(data.value(forKey: "title") as! String)
            }
            self.tableView.reloadData()
        } catch {
            print("Failed")
        }
    }
   func GoToRemover()
   {
    
     GoLoadCoreData()
   }
    
}
