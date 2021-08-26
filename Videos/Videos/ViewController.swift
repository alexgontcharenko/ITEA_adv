//
//  ViewController.swift
//  Videos
//
//  Created by Steew on 12.08.2021.
//

import UIKit

class ViewController: UIViewController {
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
//        let urlSession = URLSession.shared
//        guard let url = URL(string: "http://qvk8l.mocklab.io/movies") else { return }
//        urlSession.dataTask(with: url) { data, response, error  in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                let decoder = JSONDecoder()
//                let movie = try? decoder.decode([Movies].self, from: data)
//                self.appDelegate.saveContext()
//            }
//        } .resume()
    }
    
    private func getData() {
        let movies = try? appDelegate.persistentContainer.viewContext.fetch(Movies.fetchRequest()) as? [Movies]
        
        movies?.forEach({ movie in
            print("______")
            print("\(movie.id)")
            print("\(movie.originalTitle ?? "")")
            print("\(movie.overview ?? "")")
        })
    }

}

