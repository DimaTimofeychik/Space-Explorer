import UIKit

struct WelcomeScreenInfo {
    let backgroundImage: UIImage
    let title: String
}

let cells: [WelcomeScreenInfo] = [
WelcomeScreenInfo(backgroundImage: UIImage(named: "APODPImage") ?? UIImage(),
                  title: "Astronomy Picture of the Day"),
WelcomeScreenInfo(backgroundImage: UIImage(named: "asteroidsImage") ?? UIImage(),
                  title: "Near Earth Objects"),
WelcomeScreenInfo(backgroundImage: UIImage(named: "curiosityRoverImage") ?? UIImage(),
                  title: "Mars Rover Photos")
]

