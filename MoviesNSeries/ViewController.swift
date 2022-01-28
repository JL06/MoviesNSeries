//
//  ViewController.swift
//  MoviesNSeries
//
//  Created by temp on 27/01/22.
//

import UIKit
import MoviesTvSeriesFramework
import MoviesSeriesDominioFramework
import ApiConFramework

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let moviesNseries: MoviesTvSeriesFramework = MoviesTvSeriesFramework(llave: "05e3d00ae13d42a1dda51e75a27fcc49")
    var contenidoPeliculas: [[Movie]] = [[]]
    var contenidoSeries: [[TvSerie]] = [[]]
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.moviesNseries.obtenerTopPeliculas()
        self.moviesNseries.obtenerTopSeries()
        self.moviesNseries.obtenerFavPeliculas()
        self.moviesNseries.obtenerFavSeries()
        
        self.moviesNseries.bindMoviesToptoController = {
            if let pelis = self.moviesNseries.peliculasTop?.peliculas {
                self.contenidoPeliculas.append(pelis)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
        }
        
        self.moviesNseries.bindSeriesToptoController = {
            if let series = self.moviesNseries.seriesTop?.series {
                self.contenidoSeries.append(series)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
        self.moviesNseries.bindMoviesFavtoController = {
            if let pelis = self.moviesNseries.peliculasFav?.peliculas {
                self.contenidoPeliculas.append(pelis)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
        self.moviesNseries.bindTvSeriesFavtoController = {
            if let series = self.moviesNseries.seriesFav?.series {
                self.contenidoSeries.append(series)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.contenidoPeliculas[section].count
            
        case 1:
            if self.contenidoPeliculas.count < 2 {
                return 0
            } else {
                return self.contenidoPeliculas[section].count
            }
            
        case 2:
            return self.contenidoSeries[section - 2].count
            
        case 3:
            if self.contenidoSeries.count < 2 {
                return 0
            } else {
                return self.contenidoSeries[section - 2].count
            }
            
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.contenidoPeliculas.count + self.contenidoSeries.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        
        var imgPoster: String?
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaReusable", for: indexPath) as! MainCell
        
        switch indexPath.section {
        case 0:
            celda.titulo.text = self.contenidoPeliculas[indexPath.section][indexPath.row].titulo
            imgPoster = self.contenidoPeliculas[indexPath.section][indexPath.row].imagen
            
        case 1:
            if self.contenidoPeliculas.count < 2 {
                celda.titulo.text = "Cargando"
            } else {
                celda.titulo.text = self.contenidoPeliculas[indexPath.section][indexPath.row].titulo
                imgPoster = self.contenidoPeliculas[indexPath.section][indexPath.row].imagen
            }
            
        case 2:
            celda.titulo.text = self.contenidoSeries[indexPath.section - 2][indexPath.row].titulo
            imgPoster = self.contenidoSeries[indexPath.section - 2][indexPath.row].imagen
            
        case 3:
            if self.contenidoSeries.count < 2 {
                celda.titulo.text = "Cargando"
            } else {
                celda.titulo.text = self.contenidoSeries[indexPath.section - 2][indexPath.row].titulo
                imgPoster = self.contenidoSeries[indexPath.section - 2][indexPath.row].imagen
            }
            
        default:
            celda.titulo.text = "Vacio"
        }
        
        if let imgPath = imgPoster {
            let urlsDeApi = MoviesSeriesDominioFramework(apiKey: "")
            let conexion = ApiConFramework(url: urlsDeApi.obtenerURLImage(image: imgPath))
            conexion.obtenerRecurso { dat in
                if let datos = dat {
                    DispatchQueue.main.async {
                        celda.poster.image = UIImage(data: datos)
                    }
                }
            }
        }
        
        return celda
    }
    
    

    
}

