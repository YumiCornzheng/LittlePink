import UIKit

var greeting = "Hello, playground"

let learn = {(lea: String) -> String in
    "学习\(lea)"
}

print(learn("asd"))
print("qq")


//嵌套函数,闭包作为函数参数
func printWeather(day: String, weather: () -> String){
    "\(day)天气是\(weather())"
}

printWeather(day: "今天") {
    "雨天"
}

func pringWeather(day: String, temWeather: (Int, String) -> String ){
    "\(day)的天气是\(temWeather(35,"晴天"))"
}

pringWeather(day: "明天") {
    "\($0)度,是个\($1)"
//    tem += 1
//    weather = "阴天"
}
//pringWeather(day: " ") { adad, adad in
//    "sss"
//}


// 闭包捕获

func loopAdd(baseNumber: Int) -> () -> Int{
    var num = 0
    let incary = { () -> Int in
        num += baseNumber
        return num
    }
    return incary
}

let app1 = loopAdd(baseNumber: 10)
app1()
app1()

