//
//  PeliculaDTO.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import Foundation
struct PeliculaDTO: Codable {
    let adult: Bool
    let id: Int
    let overview: String
    let releaseDate: String
    let title: String
    let posterPath: String
}
