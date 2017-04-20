import requests
from bs4 import BeautifulSoup

def pullSlopeReportToJson():
	arapUrl = "http://coloradoski.com/snow-report"
	arapWeb = requests.get(arapUrl)

	data = []

	soup = BeautifulSoup(arapWeb.text, "html.parser")
	table = soup.find('table', attrs={"id":"snow-report"})
	table_body = table.find('tbody')

	rows = table_body.find_all('tr')
	for row in rows:
			cols = row.find_all('td')
			cols = [ele.text.strip() for ele in cols]
			data.append([ele for ele in cols if ele])
	print data[8][0]

pullSlopeReportToJson()
