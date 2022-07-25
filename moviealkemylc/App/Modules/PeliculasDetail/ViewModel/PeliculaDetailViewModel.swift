//
//  PeliculaDetailModel.swift
//  moviealkemylc
//
//  Created by Luciano Federico Castro on 24/07/2022.
//

import Foundation

class PeliculaDetailViewModel {
    private var delegate: PeliculaDetailDelegate
    private var service: PeliculaDetailService
    private var peliculaID: Int
    
    init(peliculaID: Int, service: PeliculaDetailService, delegate: PeliculaDetailDelegate) {
        self.peliculaID = peliculaID
        self.service = service
        self.delegate = delegate
    }
    
    // Implementacion con closure
    /*
     func getPokemon(onGetPokemon: @escaping (PokemonDetailDTO) -> Void) {
     */
    func getPelicula() {
        service.getPelicula(idPelicula: peliculaID) { pelicula in
            self.delegate.peliculaData(data: pelicula)
        } onError: { errorMessage in
            self.delegate.showError(error: errorMessage)
        }

            /*
            onGetPokemon(pokemon)
             */
       
    }
}
