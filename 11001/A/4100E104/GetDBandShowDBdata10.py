# GetDB and show DB data with 3 kinds of outputs on browser
from logging import exception
from pymysql import *   
import streamlit as st    
import pandas as pd
from PIL import Image

#匯入圖片
image = Image.open('Dog.png')

# sidebar creation
st.sidebar.header('User Input Parameters')
st.sidebar.text("Insert data into student table")
Major_name = st.sidebar.text_input('Major',  '')
Student_id = st.sidebar.text_input('Student_id',  '')
name = st.sidebar.text_input('name',  '')
sex = st.sidebar.text_input('sex',  '')
grade = st.sidebar.text_input('grade',  ' ')

#圖片顯示 width調整寬度
st.image(image,width=500)
try: 
    # create a connection to DB
    conn = connect(host='localhost',
                   port=3306,user='root',
                   password='',
                   database='ksu_database',
                   charset='utf8')
          
    # create cursor object
    cursor = conn.cursor()
        

   # for Web page
    st.title('Web output! ')

    # 如果最後一筆資料不為空在執行
    if grade !=' ':
        sql ="""INSERT INTO student (Major,Student_ID,Name,Sex,Grade)  
        VALUES ('%s','%s','%s','%s','%s')""" % (Major_name,Student_id,name,sex,grade)
        count = cursor.execute(sql)       
        conn.commit()


        sql='SELECT * FROM student'
        count = cursor.execute(sql)

        result_all = cursor.fetchall()
    # Show DB data using stream.write()
        for row in result_all:
            print   (row[0], "\t", row[1], "\t", 
                    row[2], "\t", row[3], "\t", row[4] )  
        
        
        # transfor DB data to dataframe without indexing
        st.text ('* Show DB data using DataFrame:')
        df=pd.DataFrame(result_all)
        styler = df.style.hide_index()
        st.write(styler.to_html(), unsafe_allow_html=True)
        
    
        # close the used objects in Memory
        cursor.close()
        conn.close()
    
except Exception as ex:
    st.write('Waiting!')
    print(ex)
  
 
