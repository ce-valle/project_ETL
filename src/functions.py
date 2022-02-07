import requests as req
from bs4 import BeautifulSoup as bs

def scraping(url):    

    html=req.get(url).content
    soup=bs(html, 'html.parser')
    tabla=soup.find_all('table')
    return tabla


def filas(tabla):

    filas=tabla[0].find_all('tr')
    filas=[f.text.strip().split('\n') for f in filas]
    return filas