# save this as app.py
from flask import Flask, render_template
app = Flask(_name_)

###
@app.route('/text')
def text():
	return '<html><body><h1>HeLLo World/h1></body></html>'
@app.route('/home')
def home():
	return render_template( 'home.html')
@app.route('/page/text')
def pageText():
	return render_template( 'page.html', text="Python Flask !")
@app.route('/page/app')
def pageAppInfo():
	appInfo = {     # dict
	id': 5,
	'name': 'Python - Flask',
	''version': '1.0.1',
	'author': 'Enoxs',
	'remark ': 'Python - Web Framework'
      }
	return render_template('page.html ', appInfo=appInfo)

@app.route('/page/data')
def pageData():
	data = {     # dict
	'01': 'Text Text Text',
	'02': 'Text Text Text',
	'03': 'Text Text Text',
	'04': 'Text Text Text',
	'05': 'Text Text Text',
      }
	return render_template('page.html ', data=data)

@app.route('/static')
def staticPage():
	return render_template('static.html')

###
@app.route("/")
@app.route("/hello")
def hello():
	return "Hello, Informatin Department!"

# http://127.0.0.1:5000/Android       String=>Android
@app.route('/<name>', methods=['GET' ])
def  queryDataMessageByName (name):
	print("type(name) : ", type(name))
	return 'String => {}'.format(name)

#http://127.0.0.1:5000/66     int=>66
@app.route('<int:id>', methods=['GET'])
def queryDataMessageById(id):
	print("type(id) : ", type(id))
	return 'int => {}'.format(id)

#http://127.0.0.1:5000/77.34     float=> 77.34
@app.route('/<float:num>', methods=['GET'])
def queryDataMlessageByVersion (num):
	print("type(num) : ", type(num))
	return 'float => {}'.format(num)
if_name_ == '_main_':
	app.run(debug=True)
