import Foundation
import SpriteKit

class WelcomeBackPopUp: SKSpriteNode {
    var mainCurrency: MainCurrency
    var value: Decimal
    var timeAway: Decimal
    
    init(mainCurrency: MainCurrency, value: Decimal, timeAway: Decimal) {
        self.mainCurrency = mainCurrency
        self.value = value
        self.timeAway = timeAway
        super.init(texture: nil, color: UIColor(named: "white")! ,size: CGSize(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.5))
        self.position = CGPoint(x: 0, y: 0)
        self.isUserInteractionEnabled = true
        self.zPosition = 150
        self.name = "welcomeBackPopUp"
        
        let welcomeBack: SKLabelNode = SKLabelNode(text: "WelcomeBack!")
        welcomeBack.fontName = "Montserrat-Bold"
        welcomeBack.fontSize = self.size.height * 0.08
        welcomeBack.position = CGPoint(x: 0, y: self.size.height * 0.3)
        welcomeBack.fontColor = UIColor(named: "black")
        let earned: SKLabelNode = SKLabelNode(text: "You earned")
        earned.fontName = "Montserrat-SemiBold"
        earned.fontSize = welcomeBack.fontSize * 0.95
        earned.position = CGPoint(x: 0, y: welcomeBack.position.y - self.size.height * 0.1)
        earned.fontColor = UIColor(named: "black")
        let coinImage: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImage.size = CGSize(width: welcomeBack.fontSize, height:  welcomeBack.fontSize)
        let coins: SKLabelNode = SKLabelNode(text: "\(mainCurrency.decimalToString(value: value))")
        coins.fontName = "Montserrat-SemiBold"
        coins.fontSize = welcomeBack.fontSize * 0.9
        coins.fontColor = UIColor(named: "black")
        coins.horizontalAlignmentMode = .left
        coinImage.position = CGPoint(x: -((coinImage.size.width - self.size.width * 0.07 + coins.frame.width)/2), y: earned.position.y - self.size.height * 0.08)
        coins.position = CGPoint(x: coinImage.position.x + (self.size.width * 0.07), y: coinImage.position.y - coinImage.size.height/2.5)
        let whileOff1: SKLabelNode = SKLabelNode(text: "during the \(self.timeAway)s that")
        whileOff1.fontName = "Montserrat-Regular"
        whileOff1.fontSize = welcomeBack.fontSize * 0.7
        whileOff1.position = CGPoint(x: 0, y: coins.position.y - self.size.height * 0.1)
        whileOff1.fontColor = UIColor(named: "black")
        let whileOff2: SKLabelNode = SKLabelNode(text: "you were offline.")
        whileOff2.fontName = "Montserrat-Regular"
        whileOff2.fontSize = welcomeBack.fontSize * 0.7
        whileOff2.position = CGPoint(x: 0, y: whileOff1.position.y - self.size.height * 0.08)
        whileOff2.fontColor = UIColor(named: "black")
        
        self.addChild(welcomeBack)
        self.addChild(earned)
        self.addChild(coinImage)
        self.addChild(coins)
        self.addChild(whileOff1)
        self.addChild(whileOff2)
        self.addChild(LetsPlaybutton(popUp: self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
