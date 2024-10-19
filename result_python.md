```python


from datetime import datetime, timedelta

import pandas as pd

ls = []
diff = datetime.now() + timedelta(days=-2)
d = str(diff.strftime("%d/%b/%Y"))


class Expense:
    def __init__(self):
        self.amt = 0

    def amount_to_pay(self):
        return self.amt

    def add_to_cart(self, my_item):
        if my_item['actual_exp'] is None:
            my_item['actual_exp'] = my_item['mrp_per_kg'] * my_item['kg_taken']
        self.amt += my_item['actual_exp']
        ls.append(my_item)


x = Expense()
x.add_to_cart({
    'date': d,
    'name': 'tomato_avg',
    'mrp_per_kg': 10,
    'kg_taken': 2,
    'expected_expense': None,
    'actual_exp': None
})

print(x.amount_to_pay())


def m_xpath():
    df = pd.DataFrame()
    df = pd.concat([df, pd.DataFrame.from_records(ls)])
    df.to_excel(f'out.xlsx', index=False)


if __name__ == '__main__':
    m_xpath()


```


# fast API

## set up

```txt
fastapi~=0.85.0
pydantic~=1.10.2
uvicorn~=0.18.3
requests~=2.28.2
```

```python
from fastapi import FastAPI
import uvicorn

app = FastAPI()

if __name__ == "__main__":
    # uvicorn main:app --reload --port 5000
    uvicorn.run("main:app", host="127.0.0.1", port=5000, log_level="info", reload=True)

```

## pydantic class

```python
from pydantic import BaseModel


class ERP(BaseModel):
    a1: str
    a2: str

class MSFileName(BaseModel):
    fn: str
    sn: str


class DMFileName(BaseModel):
    fn: str
    sn: str


class DMSheet(BaseModel):
    loc: str
    ct: str
    dm: DMFileName
    ms: MSFileName

```

## router

```python
from fastapi import APIRouter

util = APIRouter()


@util.post('/create-invoice', status_code=201)
def get_dir(item: ERP):
    return item
```

## add router to main

app object is initialised previously

```python
from controller import controller_create_invoice

app.include_router(controller_create_invoice.util)
```

## post
```python
@dm.post("/tag-master", status_code=200)
async def tag_master(item: MapXpath):
    res = ms1.tag_master(item.loc, item.ct, item.fn, item.sn)
    return {'status': res}
```

## car
```html

<style>
    .btn {
        margin: 0.2em;
    }
</style>

<div>
    <h2>{{car[0]}}</h2>
    <h2>{{car[1]}}</h2>


</div>
```

## create
```html
{% include 'header.html' %}
{% include 'navbar.html' %}
<div class="container" style="margin-top: 1em;">
    <form action="/cars" method="POST">
        <div class="row">
            <div class="col-md-6">

                <div class="mb-3">
                    <label class="form-label">Input location of stefan excel</label>
                    <input type="text" class="form-control" name="year"
                           value="C:/Users/saksangal/Documents/Zoom/Book1.xlsx">
                </div>

                                <div class="mb-3">
                    <label class="form-label">Sheet name</label>
                    <input type="text" class="form-control" name="sn"
                           value="Sheet1">
                </div>
            </div>
            <div class="col-md-6">

                <div class="mb-3">
                    <label class="form-label">Output location of java file</label>
                    <input type="text" class="form-control" name="java"
                           value="C:/Users/saksangal/Documents/Zoom/out.txt">
                </div>

                <button type="submit" class="btn btn-primary block">Submit</button>
            </div>
        </div>


    </form>
</div>
{% include 'footer.html' %}
```

## footer
```html
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
```

## header
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="{{url_for('static', path='/style.css')}}" type="text/css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{title|default("Document")}}</title>
</head>
<body>
```

## home
```html
{% include 'header.html' %}
{% include 'navbar.html' %}
<h1>Welcome to your first app in FastAPI!</h1>
{% include 'footer.html' %}
```

## index.html
```html
{% include 'header.html' %}
{% include 'navbar.html' %}
<div class="container-fluid">
    {% for car in cars %}
        <div class="row justify-content-center" style="text-align: center;">
            <div class="col col-sm-6" style="border: 1px solid black; margin: 1em 0.5em; border-radius: 10px;">
                {% include 'car.html' %}
            </div>
        </div>
    {% endfor %}
</div>
{% include 'footer.html' %}
```

## navbar
```html
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Util</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<br><br>
<br>
```

## style
```html
.navbar-brand {
    font-weight: 600;
    font-size: 1.5em;
}

.navbar-dark .navbar-nav .nav-link {
    color: white;
}
```

```python
import glob
import json
import re

from lxml import etree
import pandas as pd

tag_dic = {}


class SetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        return json.JSONEncoder.default(self, obj)


def xml_traverse(parent, root, xpath):
    tag_name = etree.QName(root).localname
    if tag_name not in tag_dic:
        tag_dic[tag_name] = {
            'tag': tag_name,
            'parent': parent,
            'attrib': {},
            'text': 'no',
            'child': set()
        }
    # print(len(root.text))
    pattern = '(\n|\s)*'
    if root.text is not None and not re.fullmatch(pattern, root.text):
        tag_dic[tag_name]['text'] = 'yes'

    if root.tail is not None and not re.fullmatch(pattern, root.tail):
        tag_dic[tag_dic[tag_name]['parent']]['text'] = 'yes'

    for k, v in root.attrib.items():
        if k not in tag_dic[tag_name]['attrib']:
            tag_dic[tag_name]['attrib'][k] = set()
        tag_dic[tag_name]['attrib'][k].add(v)

    for child in root:
        if not (type(child) == etree._ProcessingInstruction) and not (type(child) == etree._Comment):
            tag_dic[tag_name]['child'].add(etree.QName(child).localname)
            xml_traverse(tag_name, child, f'{xpath}/{etree.QName(child).localname}')


if __name__ == '__main__':
    # xml_folder = input('xml folder loc: ')
    # for xml_file in glob.glob(f"{xml_folder}/*.xml"):
    for xml_file in glob.glob(f"*.xml"):
        tree = etree.parse(xml_file)
        root = tree.getroot()
        xml_traverse(None, root, etree.QName(root).localname)
        df = pd.DataFrame(tag_dic.values())
    # out = input('output loc:    ')
    # df.to_excel(f'{out}/mastersheet.xlsx', index=False)
    df.to_excel(f'mastersheet.xlsx', index=False)

```


```python
import re

import pandas as pd


df_p = pd.read_excel('akshu_p.xlsx', sheet_name='pat')
df = pd.read_excel('akshu.xlsx', sheet_name='Sheet1')

for index1, row1 in df_p.iterrows():
    for index, row in df.iterrows():
        if pd.isnull(df.loc[index, 'comp']):
            print(row1['pat'], row['xpath'])
            pat = re.compile(row1['pat'])
            if re.fullmatch(pat, row['xpath']):
                df.iat[index, 2] = row1['comp']
                df.iat[index, 3] = row1['style']

df.to_excel('akshu.xlsx', index=False)



```


```python
import json

from flask import Flask, jsonify

app = Flask(__name__)
x = {}

# Todo 1: Returns % of players above a particular year.
#  Input could be any year for example, 1989.
#  All players born on or after 1989 should be
#  considered and the percentage should be calculated.
@app.route('/year/<int:year>')
def get_player_by_year(year):
    z = []
    year -= 1
    for dic in x.values():
        try:
            y = int('19' + dic['DOB'].rsplit('-', 1)[1])
        except:
            y = -1
        if year < y:
            z.append(dic)
    per = str(round(len(z) / len(x) * 100, 2))
    return jsonify({"player_percentage": per + "%"})


# Todo 2: Average age of players in the different teams.
@app.route('/avg-age')
def average_age():
    ans_dic = {}
    for dic in x.values():
        if dic['Country'] != "":
            y = int('19' + dic['DOB'].rsplit('-', 1)[1])
            if dic['Country'] in ans_dic:
                ans_dic[dic['Country']].append(2022 - y)
            else:
                ans_dic[dic['Country']] = [2022 - y]

    for k, v in ans_dic.items():
        ans_dic[k] = round(sum(v) / len(v), 2)

    return jsonify(ans_dic)


# Todo 3: Which country has the maximum number of left-hand batsmen.
@app.route('/left-hand')
def left_hand():
    ans_dic = {}
    for dic in x.values():
        if dic['Country'] != "":
            if dic['Batting_Hand'] == 'Left_Hand':
                v = ans_dic.get(dic['Country'], 0)
                ans_dic[dic['Country']] = v + 1

    k, v = max(ans_dic.items(), key=lambda k: k[1])
    return jsonify({k: v})

# Todo 4: List all the players whose Country is not identified in the dataset.
@app.route('/und-player')
def und_player():
    ls = []
    for dic in x.values():
        if dic['Country'] == "":
            ls.append(dic['Player_Name'])
    return jsonify(ls)


# Todo 5: List of all players in an input Country
@app.route('/country/<string:country>')
def get_player_by_country(country):
    ls = []
    for dic in x.values():
        if dic['Country'] == country:
            ls.append(dic['Player_Name'])
    return jsonify(ls)


def load_json():
    global x
    with open('static/player.json') as f:
        x = json.load(f)


load_json()

if __name__ == '__main__':
    app.run()

```


```python

import csv
import json


def make_json(csv_path, json_path):
    data = {}
    with open(csv_path, encoding='utf-8-sig') as csvf:
        reader = csv.DictReader(csvf)
        for rows in reader:
            key = rows['Player_Name']
            data[key] = rows

    with open(json_path, 'w', encoding='utf-8') as jsonf:
        jsonf.write(json.dumps(data, indent=4))


if __name__ == '__main__':
    csv_path = r'static/Players.csv'
    json_path = r'static/player.json'
    make_json(csv_path, json_path)


```


```text
Steps to run:

pip install -r requirements.txt
run csv_to_json.py
run app.py

host:
http://127.0.0.1:5000

end point:
/year/<int:year>
/avg-age
/left-hand
/und-player
/country/<string:country>
```


```txt
Flask~=2.1.1
app~=0.0.1
```


```python
from app import app
import unittest


class FlaskTest(unittest.TestCase):

    def test_get_player_by_year(self):
        tester = app.test_client(self)
        res = tester.get('/year/1989')
        sc = res.status_code
        self.assertEqual(sc, 200)
        self.assertEqual(res.content_type, 'application/json')
        self.assertEqual(b'{"player_percentage":"21.2%"}\n', res.data)

    def test_average_age(self):
        tester = app.test_client(self)
        res = tester.get('/avg-age')
        sc = res.status_code
        self.assertEqual(sc, 200)
        self.assertEqual(res.content_type, 'application/json')
        self.assertEqual(
            b'{"Australia":40.03,"Bangladesh":35.8,"England":40.29,"India":36.17,"Netherlands":42.0,"New Zealand":37.77,"Pakistan":41.31,"South Africa":39.33,"Sri Lanka":41.1,"West Indies":37.89,"Zimbabwea":42.5}\n',
            res.data)

    def test_left_hand(self):
        tester = app.test_client(self)
        res = tester.get('/left-hand')
        sc = res.status_code
        self.assertEqual(sc, 200)
        self.assertEqual(res.content_type, 'application/json')
        self.assertEqual(b'{"India":58}\n', res.data)
        # self.assertEqual(, res.data)

    def test_und_player(self):
        tester = app.test_client(self)
        res = tester.get('/und-player')
        sc = res.status_code
        self.assertEqual(sc, 200)
        self.assertEqual(res.content_type, 'application/json')
        self.assertEqual(
            b'["A Choudhary","A Dananjaya","A Hales","A Joseph","A Roy","A Turner","AJ Tye","Ankit Soni","AR Bawne","AS Yadav","Avesh Khan","B Stanlake","BA Stokes","Basil Thampi","C de Grandhomme","C Ingram","CR Woakes","D Shorey","D Short","D Willey","DM Bravo","E Lewis","H Brar","H Gurney","H Klaasen","H Vihari","H Viljoen","Harmeet Singh (2)","I Sodhi","J Archer","J Bairstow","J Behrendorff","J Dala","J Denly","J Searles","JJ Roy","K Ahmed","K Gowtham","K Khejroliya","K Paul","K Rabada","KM Asif","L Ferguson","L Livingstone","L Ngidi","L Plunkett","LH Ferguson","M Ali","M Lomror","M Markande","M Santner","M Ur Rahman","M Wood","MJ Henry","Mohammad Nabi","Mohammed Siraj","N Naik","N Pooran","NB Singh","Niraj Patel","O Thomas","P Chopra","P Krishna","P R Barman","P Raj","P Shaw","R Bhui","R Parag","R Salam","R Singh","RA Tripathi","Rashid Khan","RD Chahar","S Curran","S Dube","S Gill","S Hetmyer","S Kuggeleijn","S Lamichhane","S Mavi","S Midhun","S Rutherford","S Sharma","S Singh","S Warrier","SD Lad","SP Jackson","SS Agarwal","T Curran","T Natarajan","Tejas Baroka","TS Mills","V Chakravarthy","Vishnu Vinod","Washington Sundar"]\n',
            res.data)

    def test_get_player_by_country(self):
        tester = app.test_client(self)
        res = tester.get('/country/England')
        sc = res.status_code
        self.assertEqual(sc, 200)
        self.assertEqual(res.content_type, 'application/json')
        self.assertEqual(
            b'["A Flintoff","AC Thomas","AD Mascarenhas","CJ Jordan","CK Langeveldt","EJG Morgan","GR Napier","JC Buttler","LJ Wright","MJ Lumb","OA Shah","PD Collingwood","RS Bopara","SW Billings"]\n',
            res.data)


if __name__ == '__main__':
    unittest.main()

```




```python
import json

def dc_to_json_file(dc, fn='data.json'):
    with open(fn, 'w') as outfile:
        # sort_keys = True
        j = json.dumps(dc, indent=4)
        outfile.write(j)

```

```python

with open('file.txt', 'r') as file:
    filedata = file.read()

# Replace the target string
filedata = filedata.replace('asasas', 'ram')

# Write the file out again
with open('file.txt', 'w') as file:
    file.write(filedata)

```




```python

import json


def form_json(dc, ls):
    if ls:
        k = ls.pop(0)
        if len(ls) == 0:
            if k not in dc:
                dc[k] = ''
        else:
            if k not in dc:
                dc[k] = {}
            elif isinstance(dc[k], str):
                dc[k] = {}
            form_json(dc[k], ls)
    return dc

```

```python
def form_oa2(d, parent):
    for k, v in d.items():
        if isinstance(v, dict):
            if k.startswith("m__"):
                k = k[3:]
            parent[k] = {
                "type": "object",
                "required": [],
                "properties": {}
            }
            for x in v.keys():
                if x.startswith("m__"):
                    parent[k]['required'].append(x[3:])
            form_oa2(v, parent[k]["properties"])
        else:
            if k.startswith("m__"):
                k = k[3:]
            parent[k] = {
                "type": "string",
                "example": v
            }
    return parent
```

### pip install directory-tree-generator

```python
from DirectoryTree import TreeGenerator
Tree = TreeGenerator()
Tree.generate('.')
```




```python
import pandas as pd

def m_xpath(loc, sn):
    df = pd.read_excel(loc, sheet_name=sn)

    ans = {}
    for index, row in df.iterrows():
        xpath = row['xpath']
        ls = xpath.split('/')
        print(ls)
        ans = form_json(ans, ls)
    dc_to_json_file(ans, 'data.json')
    return 'data.json'

```

```python
def m_xpath(content_type):
    # read excel sheet and convert it to data frame
    df = pd.read_excel(f'{content_type}.xlsx', sheet_name=content_type)
    df1 = pd.read_excel('tagmaster.xlsx', sheet_name=content_type)

    pd.insert(4, 'm_xpath', '')
    pd.insert(5, 'comp', '')
    pd.insert(6, 'style', '')
    pd.insert(7, 'phase', '')
    pd.insert(8, 'feat', '')

    for index, row in df.iterrows():
        xpath = row['Legacy Xpaths']
        ls = xpath.split('/')[1:]
        map_ls = []

        for i, x in enumerate(ls):
            try:
                y = df1.loc[df1.tag == x, 'map_tag'].values[0]
            except:
                print(x)
                sys.exit(0)
            if y != 'skip':
                map_ls.append(y)
        df.iat[index, 4] = '/'.join(map_ls)
        print(index)
    df.to_excel(f'{content_type}_out.xlsx', index=False)
```

