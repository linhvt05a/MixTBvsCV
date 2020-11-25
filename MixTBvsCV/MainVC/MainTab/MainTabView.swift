
import  UIKit

class MainTabview: UIViewController {
   let tabb = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
        configTab()
    }

    func configTab(){
        let Home = ProductVC()
        let Live =  LiveVC()
        let Favorite = FavoritesVC()
        let Account = AccountVC()
        let Bag = BagVC()
        tabb.tabBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1451733733)
        tabb.viewControllers = [Live, Favorite,Home, Account, Bag]
         setTabTilte()
        self.view.addSubview(tabb.view)
        
    }
    
    func setTabTilte(){
        let titles = [
            TabarModel(title: "Live", image: "live", selectedImage: "liveBlack"),
            TabarModel(title: "Favorite", image: "heart", selectedImage: "heartBlack"),
            TabarModel(title: "XTstore", image: "phone", selectedImage: "phoneBlack"),
            TabarModel(title: "Account", image: "user", selectedImage: "userBlack"),
            TabarModel(title: "Bag", image: "shopping-bags", selectedImage: "shoppingblack")
        ]
        
        guard let items = tabb.tabBar.items else {
            return
        }
        
        for i in 0 ..< items.count {
            items[i].title = titles[i].title
            items[i].image = UIImage(named: titles[i].image)
            items[i].selectedImage = UIImage(named: titles[i].selectedImage)
           tabb.selectedIndex = 2
        }
    }
    
}
