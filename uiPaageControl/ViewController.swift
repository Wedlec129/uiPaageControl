//
//  ViewController.swift
//  uiPaageControl
//
//  Created by Борух Соколов on 28.03.2023.
//

import UIKit


//мы создали pageVC и файл к нему,связали их так эе мы создади СontentVC
//мы ипо делаем свой шаблон
//мы сделали так что о приложение показывается только 1 раз всегда)
//типо удали и скачай что бы заново зеен



class ViewController: UIViewController {

    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      
            //в момент запуска прилржения показываем наши страницы
            startPresentation()
        
    
    }

    // Презентация при первом запуске
    func startPresentation() {
        
            // Отображение PageViewController
            //мы добавили наш индификаторв pageVc и он привязан к файлу
        
        
        let userDefaults = UserDefaults.standard
        let appAlreadeSeen = userDefaults.bool(forKey: "see") //типо ароверка ключа
        if appAlreadeSeen == false {
            
            //запуск
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewControl") as? PageViewController {
                
                present(pageViewController, animated: true, completion: nil)
                //можно настроить анимации через красоту)
            }
        }
    }


}

























//если ты это читаешь то продолжай эти заниматся! ты большой молодец :)
