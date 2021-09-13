//
//  PersonController.swift
//  Spotlight
//
//  Created by Stephen Davis on 9/13/21.
//

import CoreData

class PersonController {
    static let shared = PersonController()
    
    
    var persons: [Person] {
        get {
            let erik = Person(name: "Erik", bio: "A future IOS developer, Dev Mountain student and a pretty good guitar player", url: "https://www.linkedin.com/in/erik-jimenez-053086212/")
            let andrew = Person(name: "Andrew", bio: "Media and Communication Studies graduate with an eagerness to blend my people-focused mentality of helping others with my passion of technology. Avid problem solver and team player. Currently making a career pivot into iOS development.", url: "https://www.linkedin.com/in/saeyanga/")
            let henry = Person(name: "Henry", bio: "iOS Developer. Studied computer science at Oregon State University. Enjoys reading about emergent technologies, philosophy, and computer science.", url: "https://www.linkedin.com/in/whenrybateman/")
            let stephen = Person(name: "Stephen", bio: "iOS Developer that has alot to learn but is eager to \"get there.\" I love to be outside, spend time with family, and enjoy music.", url: "https://www.linkedin.com/in/webdavis/")
            return [erik, andrew, henry, stephen]
        }
        set {
            self.persons = newValue
        }
    }
    
    
    
    
    
    private lazy var fetchRequest: NSFetchRequest<Person> = {
        let request: NSFetchRequest<Person> = NSFetchRequest<Person>(entityName: StringConstants.contextEntity)
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - CRUD Methods
    func fetchPersons() {
        let persons = (try? CoreDataStack.context.fetch(fetchRequest)) ?? self.persons
        self.persons = persons
    }
    
    func createPerson(name: String, bio: String?, url: String?) {
        let person = Person(name: name, bio: bio, url: url)
        persons.append(person)
        CoreDataStack.saveContext()
    }
    
    func updatePerson(person: Person, name: String, bio: String?, url: String?) {
        person.name = name
        person.bio = bio
        person.url = url
        
        CoreDataStack.saveContext()
    }
    
    func deletePerson(_ person: Person) {
        if let index = persons.firstIndex(of: person) {
            persons.remove(at: index)
        }
        
        CoreDataStack.context.delete(person)
        CoreDataStack.saveContext()
    }
}
