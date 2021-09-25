//
//  HeroesViewModel.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import Foundation
import Combine

class HeroesViewModel: ObservableObject {
    // @Published var heroes: [Heroe]?
    @Published var marvelHeroes: MarvelHeroes?
    @Published var status = Status.main
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false) {
        if(testing) {
            getHeroeTesting()
        }
        else {
            getAllHeroes()
        }
    }
    
    func getAllHeroes() {
        self.status = Status.loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getAllCharacters())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: MarvelHeroes.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure:
                        self.status = Status.error(error: "Error in the request to Marvel")
                    case .finished:
                        self.status = Status.loaded
                }
            } receiveValue: { data in
                self.marvelHeroes = data
            }
            .store(in: &suscriptors)
    }
    
    
    func getHeroeTesting() {
        self.status = Status.loading
        
//        let hero1 = Heroe(id: 2, name: "Hulk", resultDescription: "The most strong Avenger", modified: "", thumbnail: "", resourceURI: "", comics: Comics(), series: Comics(), stories: Stories(), events: Comics(), urls: URLElement())
    }
}
