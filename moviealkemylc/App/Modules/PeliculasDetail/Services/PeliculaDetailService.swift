//
//  PeliculaDetailService.swift
//  moviealkemylc
//
//  Created by Luciano Federico Castro on 24/07/2022.
//

import Foundation

class PeliculaDetailService {
    
    func getPelicula(idPelicula: Int, onComplete: @escaping (PeliculaDetailDTO) -> Void,
                     onError: @escaping (String) -> Void) {
        let urlMovie = "https://api.themoviedb.org/3/movie/\(idPelicula)?api_key=13bf3d74e29e8c88ad50737352a241ea&language=es-ES"
        // Llamo una funciona
        ApiManager.shared.getCall(url: urlMovie) { response in
            
            // Hago un switch
            switch response {
            case .success(let data):
                // Hago un do catch
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let peliculaResponse = try decoder.decode(PeliculaDetailDTO.self, from: data)
                        onComplete(peliculaResponse)
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
