//
//  MovieCell.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Info Story", size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Salium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        NSLayoutConstraint.activate([
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        movieImageView.widthAnchor.constraint(equalToConstant: 100),
        movieImageView.heightAnchor.constraint(equalToConstant: 150),
        
        titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
        titleLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        releaseDateLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
        titleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath)") {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async { [weak self] in
                        self?.movieImageView.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }

}
