# Get more familiar with the Data Sources
#### SAP Ariba
 * Short Description: Who manages it, what kind of data is there, when is the data wiped of, etc.
 * How to access it?
   1. Step 1: Visit xx.com
   2. Step 2: XYZ
#### Open Data Portal
 * Short Description: Who manages it, what kind of data is there, when is the data wiped of, etc.
 * How to access it?
   1. Step 1: Visit xx.com
   2. Step 2: XYZ

# Scrapers
Scrapers are divided in 2 parts
1. ariba
   * ariba_driver.py: Does XYZ
   * filemanage.py: Does XYZ
   * google_drive.py: Does XYZ
   * rfp_scraper.py: Does XYZ   
3. citysite
   * bidparse.py: Does XYZ
   * bidparse.php: Does XYZ

---
Note: Find more issues and projects related to Scrapers here or by doing this...

---

# Get Started
Running the main rfp scrapers make sure `username.key` and `password.key` are present with your ariba login credentials, from the root level of the project run:
```shell
# run either the make command
make run-rfp-scraper

# or using the regular python commands
source venv/bin/acitvate
python3 scrapers/ariba/rfp_scraper.py
```

Formatting the python code using black:
```shell
# using the make target
make lint-python

# using python commands
python3 -m black scrapers/
```
