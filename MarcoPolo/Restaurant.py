# *******************************************************
# Cooper Union Hackathon
# Restaurant Menu Web Scraper
# Author: Charles Wang
# Restaurant.py
# *******************************************************

from bs4 import BeautifulSoup
import urllib

#Pulls a list of URLs
baseURL = 'http://www.allmenus.com'
ListOfMenus = urllib.request.urlopen('http://www.allmenus.com/ny/new-york/-/&filters=none')
ListOfMenus = ListOfMenus.read()
LoM = BeautifulSoup(ListOfMenus, 'lxml')

links = LoM.find_all('p', class_='restaurant_name')

TextFile = open('Menus.txt', 'w')

def MenuUpdate(Menu, Items): #Adds items and their prices to the Menu dict
    for item in Items:
            Dish = item.contents[1].text
            Price = item.contents[3].text 
            if '$' in Price:
                Menu[Dish] = Price
            else:
                Menu[Dish] = ''

for link in LoM.find_all('a'):
    if link.get('href')[-6:] == '/menu/':
        
        MenuUrl = baseURL + str(link.get('href'))
        MenuPages = urllib.request.urlopen(MenuUrl)
        MenuPages = MenuPages.read()
        MenuPagesSoup = BeautifulSoup(MenuPages, 'lxml')
        
        #Menu Title
        Title = MenuPagesSoup.find_all('h1')
        Title = Title[0].text
        
        Menu = {}   #Dict with {item: price}
        
        odd = MenuPagesSoup.find_all("li", class_='menu_item odd')
        MenuUpdate(Menu, odd)
        
        even = MenuPagesSoup.find_all("li", class_='menu_item even')
        MenuUpdate(Menu, even)
                
        oddNt = MenuPagesSoup.find_all("li", class_='menu_item odd nottop')
        MenuUpdate(Menu, oddNt)        
                
        evenNt = MenuPagesSoup.find_all("li", class_='menu_item even nottop')
        MenuUpdate(Menu, evenNt)
                
        oddNtLo = MenuPagesSoup.find_all("li", class_='menu_item odd nottop lastones')
        MenuUpdate(Menu, oddNtLo)
                
        evenNtLo = MenuPagesSoup.find_all("li", class_='menu_item even nottop lastones')
        MenuUpdate(Menu, evenNtLo)
                
        #Adds to the text file
        if Menu != {}:                
            try:
                TextFile.write(Title)
                TextFile.write(': \n')
                TextFile.write(str(Menu))
                TextFile.write('\n')
            except:
                print("Unicode error. Moving on!")
TextFile.close()
