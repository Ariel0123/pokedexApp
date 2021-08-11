//
//  PokemonService.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import Foundation


class PokemonService: ObservableObject{
    
    @Published var pokemonArr = [PokemonList]()
    @Published var errorMsg: ErrorMessage? = nil
    
    let POKEMON_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    init(){
        do{
            try self.getPokedex{result in
                switch result{
                case .success(let pokemoms):
                    DispatchQueue.main.async {
                    self.pokemonArr = pokemoms
                    }
                case .failure(let error):
                    DispatchQueue.main.async {

                    self.errorMsg = ErrorMessage(message: error)
                    }
                }
               
            }
        }catch{
            print(error)
        }
       
        
    }
    
    
    func getPokedex(completion: @escaping (Result<[PokemonList], ErrorHandler>) -> Void) throws {
        
        guard let url = URL(string: POKEMON_URL) else {
            throw ErrorHandler.errorCatch
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error ) in
            
            if let error =  error{
                completion(.failure(error as? ErrorHandler ?? .unknown))
            }else if let data = data?.parseData(removeString: "null,"){
                do{
                    let pokemon = try JSONDecoder().decode([PokemonList].self, from: data)
                    completion(.success(pokemon))
                }catch{
                    completion(.failure(error as? ErrorHandler ?? .unknown))
                }
            }else{
                completion(.failure(.unknown))
            }
            
         
        }.resume()

    }
    
    
}




extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
