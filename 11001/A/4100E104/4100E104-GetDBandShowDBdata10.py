# GetDB and show DB data with 3 kinds of outputs on browser
from logging import exception
from pymysql import *   
import streamlit as st    
import pandas as pd
from PIL import Image

image = Image.open('Dog.png')

st.sidebar.header('User Input Parameters')
st.sidebar.text("Insert data into student table")
Major_name = st.sidebar.text_input('Major',  '')
Student_id = st.sidebar.text_input('Student_id',  '')
name = st.sidebar.text_input('name',  '')
sex = st.sidebar.text_input('sex',  '')
grade = st.sidebar.text_input('grade',  ' ')

st.image(image,width=500)
try: 
    conn = connect(host='localhost',
                   port=3306,user='root',
                   password='',
                   database='ksu_database',
                   charset='utf8')
          
    cursor = conn.cursor()
        

    st.title('Web output! ')

    if grade !=' ':
        sql ="""INSERT INTO student (Major,Student_ID,Name,Sex,Grade)  
        VALUES ('%s','%s','%s','%s','%s')""" % (Major_name,Student_id,name,sex,grade)
        count = cursor.execute(sql)       
        conn.commit()


        sql='SELECT * FROM student'
        count = cursor.execute(sql)

        result_all = cursor.fetchall()
        for row in result_all:
            print   (row[0], "\t", row[1], "\t", 
                    row[2], "\t", row[3], "\t", row[4] )  
        
        
        st.text ('* Show DB data using DataFrame:')
        df=pd.DataFrame(result_all)
        styler = df.style.hide_index()
        st.write(styler.to_html(), unsafe_allow_html=True)
        
    
        cursor.close()
        conn.close()
    
except Exception as ex:
    st.write('Waiting!')
    print(ex)
  
 
