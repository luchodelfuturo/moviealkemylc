//
//  PeliculasListView.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import Foundation
import Foundation


class PeliculasListViewModel {
    
    // Referencia al service
    private var service: PeliculasListService
    
    // Referencia al delegate del viewcontroller
    private var delegate: PeliculasListDelegate

    // Array de pokemones en el contexto del viewmodel
    private var peliculas = [PeliculaDTO]()

    // Inicializador de la clase del viewmodel
    init(service: PeliculasListService, delegate: PeliculasListDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    // Funcion principal para hacer la llamada de la api y obtener los pokemones
    func getPeliculas(){
        
        service.getPeliculas { peliculas in
            // Establezco el resultado de los pokemones a mi array local
            
            self.peliculas = peliculas
            
            
            // Por medio del delegate le digo que refresce la tabla
            self.delegate.reloadTable()
        } onError: { error in
            
            // Muestro un error en caso de que exista
            self.delegate.showError(error: error)
        }

    }
    
    // Obtener un pokemon en especifico en base a su indice dentro del array
    func getPeliculas(at index: Int) -> PeliculaDTO {
        return peliculas[index]
    }
    
    // Obtener la cantidad de pokemones
    func getPeliculasCount() -> Int {
        peliculas.count
    }
    
}
