# Books to Scrape: Scraping & SQL Task

Scrapes the first 100 books (pages 1-5) from books.toscrape.com, saves them to `books.csv`, and analyzes them with SQL.

## Files
- `scraper.py`: the scraper (requests + BeautifulSoup) +Analysis by python with pandas and SQLite
- `books.csv`: the 100 scraped books
- `queries.sql`: SQLite version of the 3 queries
- `queries_ssms.sql`: SQL Server (T-SQL) version

## How to run
    pip install requests beautifulsoup4
    python scraper.py

## Five lines

**What broke, or took longer than expected?**
1. The pound sign could show up as garbage, so I set the response encoding to UTF-8.
2. Excel showed the whole CSV in one column because of my Windows list separator; the file itself was fine (I checked it with Python).
3. SQL Server rejected LIMIT (needs TOP), and in_stock was imported as text, so comparing it with 0 failed.
4. Every book is in stock, so the out-of-stock query returns zeros; I checked that this is the real data, not a bug.

**If the site blocked me after 50 requests, what would I change?**
5. I would add random delays, retry with backoff on 429/503, save results page by page so I can resume, and send a clear User-Agent.
