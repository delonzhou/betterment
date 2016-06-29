//
//  DataSeeder.swift
//  betterment
//
//  Created by Mitul Manish on 21/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import CoreData

struct DataSeeder {
    
    static func seedData(){
        
        print("seeding....")
        
        let usersList = [
            
            User(user_id: "cb3cccd9-546a-444b-bffe-1e3a5128876c", first_name: "Matt", last_name: "Murdoch", email: "matt.murdoch@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Talent(skill_name: "Photography", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Dancing", hourly_rate: 56.87, experience: 3), Talent(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["fiveleaves.png"]), WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"]), WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["donostia.png"]), WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["haighschocolate.png"])], profile_image: "man-a.png", address: "2 19 thurloo street chadtone victoria 3148 australia"),
                         
                User(user_id: "0178764a-72e2-4931-b344-9c62e842e7ae",first_name: "Sarah", last_name: "Jane", email: "sarah@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-b.png", address: "State library melbourne cbd victoria 3000 australia"),
                         
                User(user_id: "a04a0b0e-e7ad-467d-976d-4083485f209e",first_name: "Jerry", last_name: "Noel", email: "jerry.noel@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Talent(skill_name: "Start Up Counselling", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-b.png", address: "inspire 9 richmond australia"),
                         
                User(user_id: "890ad8f2-19e8-4b21-b248-e1d56f3f777a",first_name: "Danny", last_name: "Boyle", email: "danny.boyle@gmail.com", city: "Melbourne", bio: "I know my ABCD.", skill: [Talent(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-c.png", address: "Rmit building 8 melbourne 3000 victoria australia"),
                         
                User(user_id: "f1db619b-a444-46ef-96e3-1817fec4e1aa",first_name: "Daniel", last_name: "Murphy", email: "daniel.murphy@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Dancing", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Editing", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Photography", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-d.png", address: "811 belmont avenue hoffman estates il 60169"),
                         
                User(user_id: "830107fb-51cb-404d-93f5-ce717ba7c056",first_name: "Ben", last_name: "Abraham", email: "ben.abraham@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-e.png", address: "136 front street villa park il 60181"),
                         
                User(user_id: "c531570d-28a8-4967-bb94-f18b4e7545fa",first_name: "John", last_name: "Doe", email: "john.doe@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "man-f.png", address: "950 wall street Doulasville ga 30134"),
                         
                User(user_id: "62d7af73-4daf-4690-94b0-575b17db59e5",first_name: "Tom", last_name: "Legrice", email: "tom.legriceh@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-g.png", address: "926 colonial drive clermont fl 34711"),
                         
                User(user_id: "566f9271-3037-4aaf-bee1-e472cf7b51f5",first_name: "Alexandra", last_name: "Shaw", email: "alexandra.shaw@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Programming", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "woman-d.png", address: "4995 route 9 hillsborough nj 08844"),
                         
                User(user_id: "d0923080-7c8b-4601-ad48-d42fa46dd7eb",first_name: "Jennifer", last_name: "Stevens", email: "jennifer.stevens@gmail.com", city: "Melbourne", bio: "anything", skill: [Talent(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Talent(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [WorkItem(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-a.png", address: "4072 laurel lane belmont ma 02478")
        ]
        
        let managedObjectContext = (UIApplication.sharedApplication().delegate as?
            AppDelegate)?.managedObjectContext
        
        for user in usersList{
            
            let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: managedObjectContext!) as! Person
            
            entity.setValue(user.firstName, forKey: "firstName")
            entity.setValue(user.lastName, forKey: "lastName")
            entity.setValue(user.email, forKey: "email")
            entity.setValue(user.address, forKey: "address")
            entity.setValue(user.city, forKey: "city")
            entity.setValue(user.bio, forKey: "bio")
            entity.setValue(user.userID, forKey: "userID")
            entity.setValue(user.profileImage, forKey: "profileImage")
            
            do{
                try managedObjectContext!.save()
            }
            catch{
                fatalError("Unable to save object")
            }
            
            print("seeding complete ....")
            
        }
        
    }

}