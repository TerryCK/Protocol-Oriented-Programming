   enum Item: Int {
    case txtBanking, txtStatement, promotions, messages, myAccount, support, responsibleGaming, termsConditions, AboutUs, liveChat, currentLanguage, setting, logOut
    
    static let allValues = [txtBanking, txtStatement, promotions, messages, myAccount, support, responsibleGaming, termsConditions, AboutUs, liveChat, currentLanguage, setting, logOut]
    
   }

let item = Item.allValues
   for (key, element) in Item.allValues.enumerated() {
    print("key: \(key), element: \(element) and element RawValue: \(element.rawValue)")
   }

   
   enum Service: String {
    case banking, statement, promotions, messages, myAccount, support, responsibleGaming, termsConditions, aboutUs, liveChat, currentLanguage, setting, logOut
    
    static let allValues = [banking, statement, promotions, messages, myAccount, support, responsibleGaming, termsConditions, aboutUs, liveChat, currentLanguage, setting, logOut]
    
    init?(_ index: Int) {
        guard index < Service.allValues.count else {
            return nil
        }
        self = Service.allValues[index]
    }
   }
   
let container: Int?
   container = 10
   
