//
//  CoreDataManager.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct itemsCore {
   var  votecount: Int32?
   var  id: Int32?
   var  video: Bool?
   var  voteaverage: Double?
   var  title: String?
   var  popularity: Double?
   var  posterpath: String?
   var  originallanguage: String?
   var  originaltitle: String?
   var  backdroppath: String?
   var  adult: Bool?
   var  overview: String?
   var  releasedate: String
    
    init() {
        votecount = 0
        id = 0
        video = false
        voteaverage = 0
        title  = ""
        popularity = 0
        posterpath  = ""
        originallanguage  = ""
        originaltitle = ""
        backdroppath = ""
        adult = false
        overview = ""
        releasedate = ""
    }
    init( votecount: Int32?,
          id: Int32?,
          video: Bool?,
          vote_average: Double?,
          title: String?,
          popularity: Double?,
          poster_path: String?,
          original_language: String?,
          original_title: String?,
          backdrop_path: String?,
          adult: Bool?,
          overview: String?,
          release_date: String) {
        
        self.votecount = votecount
        self.id = id
        self.video = video
        self.voteaverage = vote_average
        self.title = title
        self.popularity = popularity
        self.posterpath = poster_path
        self.originallanguage = original_language
        self.originaltitle = original_title
        self.backdroppath = backdrop_path
        self.adult = adult
        self.overview =  overview
        self.releasedate = release_date
    }
}
class CoreDataManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    ///store obj into core data
    class func storeObj(votecount: Int?,
                        id: Int?,
                        video: Bool?,
                        vote_average: Double?,
                        title: String?,
                        popularity: Double?,
                        poster_path: String?,
                        original_language: String?,
                        original_title: String?,
                        backdrop_path: String?,
                        adult: Bool?,
                        overview: String?,
                        release_date: String) {
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "MovFavorites", in: context)
        
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObj.setValue(votecount, forKey: "vote_count")
        managedObj.setValue(id, forKey: "id")
        managedObj.setValue(video, forKey: "video")
        managedObj.setValue(vote_average, forKey: "vote_average")
        managedObj.setValue(title, forKey: "title")
        managedObj.setValue(popularity, forKey: "popularity")
        managedObj.setValue(poster_path, forKey: "poster_path")
        managedObj.setValue(original_language, forKey: "original_language")
        managedObj.setValue(original_title, forKey: "original_title")
        managedObj.setValue(backdrop_path, forKey: "backdrop_path")
        managedObj.setValue(adult, forKey: "adult")
        managedObj.setValue(overview, forKey: "overview")
        managedObj.setValue(release_date, forKey: "release_date")
        
        do {
            try context.save()
            print("saved!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    ///fetch all the objects from core data
    class func fetchObj(selectedScopeIdx:Int?=nil,targetText:String?=nil) -> [itemsCore]{
        var aray = [itemsCore]()
        
        let fetchRequest:NSFetchRequest<MovFavorites> = MovFavorites.fetchRequest()
        
        if selectedScopeIdx != nil && targetText != nil{
            
            var filterKeyword = ""
            switch selectedScopeIdx! {
            case 0:
                filterKeyword = "id"
            case 1:
                filterKeyword = "title"
            default:
                filterKeyword = "release_date"
            }
            
            var predicate = NSPredicate(format: "\(filterKeyword) contains[c] %@", targetText!)
            //predicate = NSPredicate(format: "by == %@" , "wang")
            //predicate = NSPredicate(format: "year > %@", "2015")
            
            fetchRequest.predicate = predicate
        }
        
        do {
            let fetchResult = try getContext().fetch(fetchRequest)
            
            for item in fetchResult {
               /* let img = itemsCore(id: item.id,
                                    title: item.title!,
                                    date: item.release_date!,
                                    image: item.poster_path!)*/
                
                let img = itemsCore(votecount: item.vote_count,
                                    id: item.id,
                                    video: item.video,
                                    vote_average: item.vote_average,
                                    title: item.title,
                                    popularity: item.popularity,
                                    poster_path: item.poster_path,
                                    original_language: item.original_language,
                                    original_title: item.original_title,
                                    backdrop_path: item.backdrop_path,
                                    adult: item.adult,
                                    overview: item.overview,
                                    release_date: item.release_date!)
                
                aray.append(img)
                print("image name:"+img.title!+"\nimage year:"+img.releasedate+"\n")
            }
        }catch {
            print(error.localizedDescription)
        }
        
        return aray
    }
    
    ///delete all the data in core data
    class func cleanCoreDataAll() {
        
        let fetchRequest:NSFetchRequest<MovFavorites> = MovFavorites.fetchRequest()
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            print("deleting all contents")
            try getContext().execute(deleteRequest)
        }catch {
            print(error.localizedDescription)
        }
        
    }

}
