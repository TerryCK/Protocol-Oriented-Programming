enum MapFlag: String {
    case en    =  "csh_ic_uk"
    case id    =  "csh_ic_indonesia"
    case ja    =  "csh_ic_japan"
    case km    =  "csh_ic_cambodia"
    case ko    =  "csh_ic_korea"
    case pt    =  "csh_ic_brazil"
    case th    =  "csh_ic_thailand"
    case vi    =  "csh_ic_vietnam"
    case zh    =  "csh_ic_china"
    
    
}

var mapFlag = MapFlag(rawValue: "csh_ic_uk")
print(mapFlag!.rawValue)



enum Language: String {
 case en, `in`, id, ja, km, ko, pt, th, vi, zh
}

let language = Language.init(rawValue: "in")

print(language!.rawValue)

language?.rawValue


