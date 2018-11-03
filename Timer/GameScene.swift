import SpriteKit

class GameScene: SKScene {
    
    var highScore:Int = 0
    let scoreLabel = SKLabelNode()
    let button = SKSpriteNode()
    let timer = CountdownLabel()
    
    func setupButton(){
        let x = frame.midX
        let y = frame.midY - 150
        button.size = CGSize(width: 100, height: 100)
        button.position = CGPoint(x: x, y: y)
        button.color = UIColor.red
        addChild(button)
    }
    
    func setupScoreLabel(){
        let x = frame.midX
        let y = frame.midY + 150
        scoreLabel.position = CGPoint(x:x, y:y)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.text = "0"
        addChild(scoreLabel)
    }
    
    func updateScoreLabel(){
        scoreLabel.text = String(highScore)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //convert the touches into a known type
        let touchSet = touches 
        //check the timer has not finished
        if !timer.hasFinished(){
            //go through all the possible touches
            for touch in touchSet{
                //if a touch is inside the button
                if button.frame.contains(touch.location(in: self)){
                    //increment the high score and update the label
                    highScore += 1
                    updateScoreLabel()
                }
            }
        }
    }
    
    override func didMove(to view: SKView) {
        timer.position = CGPoint(x: frame.midX, y: frame.midY)
        timer.fontSize = 65;
        addChild(timer)
        timer.startWithDuration(duration: 20)
        setupButton()
        setupScoreLabel()
    }
    
    override func update(_ currentTime: TimeInterval) {
        //tell the timer to update
        timer.update()
    }
    
    //        //code for saving a high score
    //        func saveHighScore(score: Int){
    //
    //            //get the user defaults
    //            let userDefaults = UserDefaults.standard
    //            userDefaults.set(score, forKey: "highScore")
    //        }
    //
    //
    //        //code to retrieve a high score
    //        func getHighScore() -> Int{
    //
    //            //get the user defaults
    //            let userDefaults = UserDefaults.standard
    //            return userDefaults.integer(forKey: "highScore")
    //        }
}
