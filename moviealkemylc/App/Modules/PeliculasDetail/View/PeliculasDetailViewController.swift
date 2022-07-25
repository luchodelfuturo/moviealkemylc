//
//  PeliculasDetailViewController.swift
//  moviealkemylc
//
//  Created by Luciano Federico Castro on 24/07/2022.
//

import UIKit
protocol PeliculaDetailDelegate {
    func peliculaData(data: PeliculaDetailDTO)
    func showError(error: String)
}

class PeliculasDetailViewController: UIViewController {

    var peliculaID: Int = 0
    private var service = PeliculaDetailService()
    private var viewModel: PeliculaDetailViewModel?
    let stackView = UIStackView()
    
  
    
    
    
    private lazy var pokemonImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
      
        return aLabel
    }()
    private lazy var release: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 18)
        aLabel.textAlignment = .center
    
        return aLabel
    }()
    private lazy var overview: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 18)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 4
    
        return aLabel
    }()
    
    private lazy var generoLabel : UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 18)
        aLabel.textAlignment = .center
        
        return aLabel
    }()
    
    private lazy var generos : UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 18)
        aLabel.textAlignment = .center
        
        return aLabel
    }()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PeliculaDetailViewModel(peliculaID: self.peliculaID, service: service, delegate: self)
        
        self.viewModel?.getPelicula()

        // Implementación con closure
        /*
        self.viewModel?.getPokemon(onGetPokemon: { data in
            if let sprite = data.sprites.other?.home?.frontDefault, let url = URL(string: sprite) {
                self.pokemonImage.load(url: url)
            }
            
            self.pokemonName.text = data.name.uppercased()
        })
         */
        
        setupView()
    }
    
    private func setupView() {
        setupConstraints()
        view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        stackView.addArrangedSubview(pokemonName)
        stackView.addArrangedSubview(release)
        stackView.addArrangedSubview(generoLabel)
        stackView.addArrangedSubview(generos)
        stackView.addArrangedSubview(overview)
       
        
        
        view.addSubview(stackView)
//        view.addSubview(overview)
//
        
        
        NSLayoutConstraint.activate([
            
           
            pokemonImage.heightAnchor.constraint(equalToConstant: 450),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: pokemonImage.trailingAnchor, multiplier: 2),
            pokemonImage.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: pokemonImage.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalTo: pokemonImage.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: pokemonImage.trailingAnchor),
            
//            overview.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
//            overview.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            overview.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
//
            
//            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 22),
//
//            release.leadingAnchor.constraint(equalTo: pokemonName.leadingAnchor),
//            release.trailingAnchor.constraint(equalTo: pokemonName.trailingAnchor),
//            release.topAnchor.constraint(equalToSystemSpacingBelow: pokemonName.bottomAnchor, multiplier: 2)
            
            
                
        ])
    }
}

extension PeliculasDetailViewController: PeliculaDetailDelegate {
    
    func peliculaData(data: PeliculaDetailDTO) {
        
        
        pokemonName.text = data.title
        let url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(data.posterPath)"
        pokemonImage.setImage(url: url)
        release.text = "Estreno: " + data.releaseDate
        var idioma :String
        if (data.originalLanguage == "en") {idioma = "English"}else{ idioma = data.originalLanguage}
        generoLabel.text = "Idioma Principal: " + idioma
        overview.text = data.overview
        let popularity = String(data.popularity)
        generos.text = "Popularity: " + popularity
  
        
        
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
