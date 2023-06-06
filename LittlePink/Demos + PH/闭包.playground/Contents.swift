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
let app2 = loopAdd(baseNumber: 7)
app1()
app1()
app2()
app1()
app2()


//闭包函数,排序
let arr = [6,2,5,7,23,8]
let sortArr = arr.sorted {
    $0 < $1
}

//逃逸闭包
var completionHandlers: [() -> ()] = []
func someFunctionWithEscaping(completingHandler: @escaping () -> ()){
    completionHandlers.append(completingHandler)
}
func someFunctionWithNoneEscaping(handler: () -> Void){
    handler()
}

class SomeClass{
    var x = 10
    func doSomeThing(){
        someFunctionWithEscaping {
            self.x += 100
        }
        someFunctionWithNoneEscaping {
            x += 10
        }
    }
}
let S = SomeClass()
S.doSomeThing()
print(S.x)

completionHandlers.first?()
print(S.x)
//在这里逃逸闭包的作用是在异步函数执行完成时候,调用逃逸闭包的函数,以示异步函数执行完成
class TeseEscaping{
    func performAsycTask(hander: @escaping () -> ()){
        DispatchQueue.global().async {
            sleep(2)
            print("异步任务执行")
            hander()
        }
        print("普通任务执行")

    }
}
let test = TeseEscaping()
test.performAsycTask {
    print("异步任务已完成")
}
