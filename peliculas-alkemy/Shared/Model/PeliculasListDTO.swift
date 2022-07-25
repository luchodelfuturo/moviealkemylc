//
//  PeliculasListDTO.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import Foundation

// DTO: Data Transfer Object
struct PeliculasListDTO: Codable {
    let results: [PeliculaDTO]
}
