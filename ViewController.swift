import UIkit

class ViewController: UIViewCOntroller {
    private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill // De esta manera nos aseguramos que la imagen se ajusta al ancho y alto de la pantalla
            imageView.backgroundColor = .white
            return imageView
    } ()

    private let button: UIButton = {
            let button = UIButton()
            button.setTitle("Random Photo", for: .normal)  // De esta manera nos aseguramos que la imagen se ajusta al ancho y alto de la pantalla
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            return button
    } ()

       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink // El color del fondo de mi app será rosa
        view.addSubview(imageView) // Añadimos la imagen a la vista
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center // Estableco que el centro de la foto estará en el centro de mi app

        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton),
            for: .touchUpInside)
}

    @obj func didTapButton () {
        getRandomPhoto()
    }




    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect (x: 30,
                               y: view.frame.size.heigth-150-view.safeAreaInsets.bottom,
                               width: view.frame.size.width-60,
                               height: 55
                               )
    }


    func getRandomPhoto() {
      let urlString = "https://source.unsplash.com/random/600x600"
      let url = URL(string: urlString)!  // Crea una instancia URL a partir de un string. Añadimos la exclamación para remarcar que sabemos que esa url existe.    
      guard let data = Data(contentsOf: url) else {
        return 
      }
      imageView.image = UIImage(data: data)
    }
}