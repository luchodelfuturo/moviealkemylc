//
//  PeliculasListService.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import Foundation

class PeliculasListService {
    
    func getPeliculas(onComplete: @escaping ([PeliculaDTO]) -> Void,
                     onError: @escaping (String) -> Void) {
        
        // Llamo una funciona
        ApiManager.shared.getCall(url: Constants().peliculasListURL) { response in
            
            // Hago un switch
            switch response {
            case .success(let data):
                // Hago un do catch
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let peliculaResponse = try decoder.decode(PeliculasListDTO.self, from: data)
                        onComplete(peliculaResponse.results)
                    }
                    
                } catch {
                    onError("fallo la conversión del json")
                }
            case .failure(_):
                onError("Fallo en el apimanager")
            }
            
        }
        
        
    }
    
}
