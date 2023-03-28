//
//  PageViewController.swift
//  uiPaageControl
//
//  Created by Борух Соколов on 28.03.2023.
//

import UIKit

class PageViewController: UIPageViewController {
    
    
    let presentScreenContents = [
        "Первая страница презентации, расказывающая о том, что наше приложение из себя  предсавляет",
        "Вторая страница презентации, расказывает о какойто удобной фишке приложения",
        "Третья сраница презентации тоже рассказывает о чем то очень интересном",
        "Ну и наконец последняя страница презентации с напутствием в добрый путь =)",
        ""
    ]
    //св создали ешё пустою строку для выхода
    
    let emojiArray = ["😉", "🤓", "🧐", "👍",""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //делигируем то естт мы сами на себя сваливаем работу)
        //мы сами можем выполнять перемодку
        dataSource=self 
        
        //запускаем с первого 
        if let contentViewController=showViewControllerAtIndex(0){
            setViewControllers([contentViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    

    //настройка что показываем на индексах экрана
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        //обрабодка индекссов страниц
        guard index >= 0 else {return nil}
        guard index < presentScreenContents.count else {
            
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "see")//создали клбч see
            dismiss(animated: true, completion: nil)
            
            return nil
            
            
        }
     
        
        //мы обращаемся к индификатору ContentViewControl
        guard let contentViewController=storyboard?.instantiateViewController(
            withIdentifier: "ContentViewControl") as? ContentViewController else {return nil}
        
        //мы указываем свойства которые определены в
        //СVC и указываем наши значения по нашему шаблону(массиву)
        contentViewController.presenText=presentScreenContents[index]
        contentViewController.emoji=emojiArray[index]
        contentViewController.numberOfPages=presentScreenContents.count
        contentViewController.currentPage=index
        
        return contentViewController  //возвращаем нашу страницу
        
    }
    
}



//обработка перелистываний
extension PageViewController:UIPageViewControllerDataSource{
    
    //двигаемся назад
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        //получ тек страницу и уменьшаем её
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
