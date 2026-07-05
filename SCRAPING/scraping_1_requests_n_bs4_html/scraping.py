import requests
from bs4 import BeautifulSoup
import csv

response = requests.get('https://books.toscrape.com/catalogue/category/books_1/index.html')
soup = BeautifulSoup(response.text, 'html.parser')

book = soup.find_all("li", class_="col-xs-6 col-sm-4 col-md-3 col-lg-3")
print(f'Number of book found: {len(book)}')

results = []
for b in book:
    title = b.find("h3").find("a")["title"]
    price = b.find("p", class_="price_color").text
    availability = b.find("p", class_="instock availability").text.strip()
    results.append({
        "title": title,
        "price": price,
        "availability": availability
    })

with open('books.csv', 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['title', 'price', 'availability']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    for result in results:
        writer.writerow(result)